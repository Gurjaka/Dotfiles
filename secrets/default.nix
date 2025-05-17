{
  age.secrets = {
    netrc = {
      file = ./github_token.age;
      path = "/home/gurami/.netrc";
      owner = "gurami";
      group = "users";
      mode = "600";
    };
  };
}
