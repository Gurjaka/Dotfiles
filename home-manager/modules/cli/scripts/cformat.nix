{pkgs}:
pkgs.writeShellScriptBin "cformat" ''
  cat > .clang-format << 'EOF'
  ---
  BasedOnStyle: LLVM
  Language: Cpp

  # Indentation
  IndentWidth: 4
  TabWidth: 4
  UseTab: Never
  AccessModifierOffset: -4
  IndentCaseLabels: false
  IndentWrappedFunctionNames: false
  IndentGotoLabels: true
  IndentPPDirectives: None
  NamespaceIndentation: None

  # Pointer & reference alignment
  PointerAlignment: Right
  ReferenceAlignment: Pointer
  DerivePointerAlignment: false
  SpaceAroundPointerQualifiers: Default

  # Braces & short blocks
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

  AllowShortFunctionsOnASingleLine: false
  AllowShortLambdasOnASingleLine: false
  AllowShortIfStatementsOnASingleLine: false
  AllowShortLoopsOnASingleLine: false
  AllowShortCaseLabelsOnASingleLine: false
  AllowShortBlocksOnASingleLine: false

  # Alignment
  AlignAfterOpenBracket: Align
  AlignOperands: Align
  AlignEscapedNewlines: Right
  AlignTrailingComments: Always
  AlignConsecutiveAssignments: false
  AlignConsecutiveDeclarations: false

  # Line breaking & wrapping
  BreakBeforeBinaryOperators: None
  BreakBeforeBraces: Allman
  BreakBeforeTernaryOperators: true
  BreakConstructorInitializers: BeforeColon
  AlwaysBreakTemplateDeclarations: MultiLine
  ColumnLimit: 100
  ContinuationIndentWidth: 4
  ConstructorInitializerIndentWidth: 4
  Cpp11BracedListStyle: true
  ReflowComments: true

  # Spaces
  SpaceAfterCStyleCast: false
  SpaceAfterLogicalNot: false
  SpaceAfterTemplateKeyword: true
  SpaceBeforeAssignmentOperators: true
  SpaceBeforeCpp11BracedList: false
  SpaceBeforeCtorInitializerColon: true
  SpaceBeforeInheritanceColon: true
  SpaceBeforeParens: ControlStatements
  SpaceBeforeRangeBasedForLoopColon: true
  SpacesInAngles: false
  SpacesInContainerLiterals: true
  SpacesInParentheses: false
  SpacesInSquareBrackets: false
  SpacesBeforeTrailingComments: 1

  # Includes
  IncludeBlocks: Preserve
  SortIncludes: CaseSensitive
  SortUsingDeclarations: LexicographicNumeric

  # Misc
  Standard: Latest
  InsertTrailingCommas: None
  MaxEmptyLinesToKeep: 1
  InsertNewlineAtEOF: true

  ...
  EOF
''
