{
  programs.focus-mode = {
    enable = true;
    discordTokenFile = "/run/agenix/discord_token";
    focus_indicator = [
      "nvim"
      "code"
      ".zathura"
      "gimp"
      "libreoffice"
    ];
    check_interval = "1";
    status_dnd = "dnd";
    status_normal = "idle";
    reply_message = "I'm trying to focus now - I'll reply later! 🚀";
    max_message_age = "300";
    your_reply_window = "300";
  };
}
