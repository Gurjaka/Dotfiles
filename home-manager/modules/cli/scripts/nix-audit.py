from collections import defaultdict
import os
from pathlib import Path
import re

# --------------------------------------------------
# Paths
# --------------------------------------------------
HOME = Path.home()
ROOT = HOME / "Dotfiles"

# --------------------------------------------------
# Storage
# --------------------------------------------------
enable_true_hits = defaultdict(list)  # Path -> list[(line_no, line_text)]
pkgs_items = defaultdict(list)  # Path -> list[pkg_name]

# --------------------------------------------------
# Regex patterns
# --------------------------------------------------
enable_true_re = re.compile(r"\benable\s*=\s*true\b")
with_pkgs_re = re.compile(r"with\s+pkgs;\s*\[(.*?)\]", re.S)
valid_pkg_re = re.compile(r"^[a-zA-Z0-9._+-]+$")


# --------------------------------------------------
# Helpers
# --------------------------------------------------
def clean_token(tok: str) -> str:
    return tok.strip().strip(";").strip("]").strip("[")


def rel(p: Path) -> str:
    return str(p.relative_to(HOME))


# --------------------------------------------------
# Walk project
# --------------------------------------------------
for root, _, files in os.walk(ROOT):
    root = Path(root)

    for name in files:
        if not name.endswith(".nix"):
            continue

        path = root / name

        try:
            text = path.read_text(encoding="utf-8", errors="ignore")
        except OSError:
            continue

        # enable = true
        for i, line in enumerate(text.splitlines(), start=1):
            if enable_true_re.search(line):
                enable_true_hits[path].append((i, line.strip()))

        # with pkgs; [ ... ]
        for block in with_pkgs_re.findall(text):
            cleaned = re.sub(r"#.*", "", block)
            tokens = cleaned.replace("\n", " ").split()

            for tok in tokens:
                tok = clean_token(tok)
                if not tok:
                    continue
                if tok.startswith('"') and tok.endswith('"'):
                    continue
                if tok[0].isupper():
                    continue
                if valid_pkg_re.match(tok):
                    pkgs_items[path].append(tok)

# --------------------------------------------------
# PRINT: enable = true
# --------------------------------------------------
total_enables = sum(len(v) for v in enable_true_hits.values())
print("====== enable = true occurrences ======")
print(f"Total: {total_enables}\n")

for path in sorted(enable_true_hits):
    print(rel(path))
    for line_no, line in sorted(enable_true_hits[path]):
        print(f"  {line_no}: {line}")
    print()

# --------------------------------------------------
# PRINT: packages
# --------------------------------------------------
total_pkgs = sum(len(v) for v in pkgs_items.values())
print("====== Packages inside with pkgs; [ ... ] ======")
print(f"Total items: {total_pkgs}\n")

for path in sorted(pkgs_items):
    print(rel(path))
    for pkg in sorted(set(pkgs_items[path])):
        print(f"  {pkg}")
    print()

# --------------------------------------------------
# SUMMARY TABLE
# --------------------------------------------------
print("\n====== Summary by file ======\n")

all_files = sorted(set(enable_true_hits) | set(pkgs_items))

row_fmt = "{:<60} {:>8} {:>10}"
print(row_fmt.format("File", "Enables", "Packages"))
print("-" * 80)

for path in all_files:
    enables = len(enable_true_hits.get(path, []))
    pkgs = len(set(pkgs_items.get(path, [])))
    print(row_fmt.format(rel(path), enables, pkgs))
