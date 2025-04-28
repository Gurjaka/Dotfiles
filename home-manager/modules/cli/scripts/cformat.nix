{pkgs}:
pkgs.writeShellScriptBin "cformat" ''
  cat > .clang-format << 'EOF'
  ---
  BasedOnStyle: LLVM
  Language: Cpp
  AccessModifierOffset: -4
  AlignAfterOpenBracket: Align
  AlignConsecutiveAssignments: false
  AlignConsecutiveDeclarations: false
  AlignEscapedNewlines: Right
  AlignOperands: true
  AlignTrailingComments: true
  AllowAllArgumentsOnNextLine: false
  AllowAllConstructorInitializersOnNextLine: false
  AllowShortBlocksOnASingleLine: Empty
  AllowShortCaseLabelsOnASingleLine: false
  AllowShortFunctionsOnASingleLine: None
  AllowShortIfStatementsOnASingleLine: Never
  AllowShortLambdasOnASingleLine: All
  AllowShortLoopsOnASingleLine: false
  AlwaysBreakAfterReturnType: None
  AlwaysBreakBeforeMultilineStrings: false
  AlwaysBreakTemplateDeclarations: Yes
  BinPackArguments: false
  BinPackParameters: false
  BraceWrapping:
    AfterClass: true
    AfterControlStatement: true
    AfterEnum: true
    AfterFunction: true
    AfterNamespace: true
    AfterStruct: true
    AfterUnion: true
    BeforeCatch: true
    BeforeElse: true
    IndentBraces: false
  BreakBeforeBinaryOperators: None
  BreakBeforeBraces: Custom
  BreakBeforeTernaryOperators: true
  BreakConstructorInitializers: BeforeColon
  ColumnLimit: 120
  CompactNamespaces: false
  ConstructorInitializerIndentWidth: 4
  ContinuationIndentWidth: 4
  Cpp11BracedListStyle: true
  DerivePointerAlignment: false
  FixNamespaceComments: true
  IncludeBlocks: Regroup
  IncludeCategories:
    - Regex: '^<.*\.h>'
      Priority: 1
    - Regex: '^<.*'
      Priority: 2
    - Regex: '.*'
      Priority: 3
  IndentCaseLabels: true
  IndentWidth: 4
  KeepEmptyLinesAtTheStartOfBlocks: false
  MaxEmptyLinesToKeep: 1
  NamespaceIndentation: None
  PointerAlignment: Left
  ReflowComments: true
  SortIncludes: true
  SortUsingDeclarations: true
  SpaceAfterCStyleCast: true
  SpaceAfterLogicalNot: false
  SpaceAfterTemplateKeyword: true
  SpaceBeforeAssignmentOperators: true
  SpaceBeforeCpp11BracedList: true
  SpaceBeforeInheritanceColon: true
  SpaceBeforeParens: ControlStatements
  SpaceBeforeRangeBasedForLoopColon: true
  SpaceInEmptyParentheses: false
  SpacesInAngles: false
  SpacesInCStyleCastParentheses: false
  SpacesInContainerLiterals: false
  SpacesInParentheses: false
  SpacesInSquareBrackets: false
  Standard: Latest
  TabWidth: 4
  UseTab: Never
  ...
  EOF
''
