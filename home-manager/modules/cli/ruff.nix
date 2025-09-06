{
  programs.ruff = {
    enable = true;
    settings = {
      # Tool ruff
      line-length = 79;
      target-version = "py310";

      # Ruff lint
      lint = {
        select = ["F" "E" "W" "I" "N" "G" "PIE" "UP"];
        ignore = ["E501" "N818" "E741"];
        fixable = ["ALL"];

        # Ruff lint per-file ignores
        per-file-ignores = {
          "stubs/*" = ["N" "F403" "F405"];
        };

        # Isort settings
        isort = {
          known-first-party = [];
          known-third-party = [];
          combine-as-imports = true;
          force-sort-within-sections = true;
        };
      };

      # Format
      format = {
        quote-style = "double";
        indent-style = "space";
        skip-magic-trailing-comma = false;
        line-ending = "auto";
      };
    };
  };
}
