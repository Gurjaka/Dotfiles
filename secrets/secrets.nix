let
  gurami = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQv3Cpjg+r2Bkipu7Heu+qIhiMiSBFn10qpNJcST+iW";
  users = [gurami];

  system_desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDwX8klQiy4FlpIN1E/Pifn58qZRjFISh8cAoVyjDV3M";
  systems = [system_desktop];
in {
  "github_token.age".publicKeys = users ++ systems;
  "github_recovery_codes.age".publicKeys = users ++ systems;
  "matrix_keys.age".publicKeys = users ++ systems;
  "ente_keys.age".publicKeys = users ++ systems;
  "discord_token.age".publicKeys = users ++ systems;
  "qdrant_info.age".publicKeys = users ++ systems;
}
