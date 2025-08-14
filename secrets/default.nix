{
  age.secrets = {
    netrc = {
      file = ./github_token.age;
      path = "/home/gurami/.netrc";
      owner = "gurami";
      group = "users";
      mode = "600";
    };
    discord_token = {
      file = ./discord_token.age;
      owner = "gurami";
      group = "users";
      mode = "600";
    };
    qdrant_info = {
      file = ./qdrant_info.age;
      owner = "gurami";
      group = "users";
      mode = "600";
    };
  };
}
