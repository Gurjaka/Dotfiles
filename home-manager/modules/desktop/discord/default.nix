{
  pkgs,
  selectedTheme,
  ...
}: {
  imports = [./settings.nix];
  home.packages = [
    (pkgs.discord.override {
      withVencord = true;
    })
  ];
  xdg.configFile."Vencord/themes/theme.css".text = ''
    @import url('https://refact0r.github.io/midnight-discord/build/midnight.css');

    body {
        --font: 'JetBrains Mono Nerd Font Medium';

        --gap: 12px;
        --divider-thickness: 4px;

        --animations: on;
        --list-item-transition: 0.2s ease;
        --dms-icon-svg-transition: 0.4s ease;

        --move-top-bar-buttons: off;
        --custom-app-top-bar-height: 32px;

        --custom-window-controls: on;
        --window-control-size: 14px;

        --dms-icon: on;
        --dms-icon-svg-url: url('https://upload.wikimedia.org/wikipedia/commons/c/c4/Font_Awesome_5_solid_moon.svg');
        --dms-icon-svg-size: 90%;
        --dms-icon-color-before: var(--icon-secondary);
        --dms-icon-color-after: var(--white);

        --dms-background: off;
        --dms-background-image-url: url("");
        --dms-background-image-size: cover;
        --dms-background-color: linear-gradient(70deg, ${selectedTheme.colors.base08}, ${selectedTheme.colors.base15}, ${selectedTheme.colors.base11});

        --background-image: off;
        --background-image-url: url("");

        --transparency-tweaks: off;
        --remove-bg-layer: off;
        --panel-blur: off;
        --blur-amount: 12px;
        --bg-floating: ${selectedTheme.colors.base00};

        --flipped-chatbar: on;
        --chatbar-height: 47px;
        --chatbar-padding: 8px;
        --small-user-panel: off;
    }

    :root {
        --colors: on;

        --text-0: ${selectedTheme.colors.base00};
        --text-1: ${selectedTheme.colors.base06};
        --text-2: ${selectedTheme.colors.base05};
        --text-3: ${selectedTheme.colors.base05};
        --text-4: ${selectedTheme.colors.base04};
        --text-5: ${selectedTheme.colors.base03};

        --bg-1: ${selectedTheme.colors.base03};
        --bg-2: ${selectedTheme.colors.base02};
        --bg-3: ${selectedTheme.colors.base00};
        --bg-4: ${selectedTheme.colors.base01};

        --hover: color-mix(in srgb, ${selectedTheme.colors.base06} 5%, transparent);
        --active: color-mix(in srgb, ${selectedTheme.colors.base06} 8%, transparent);
        --active-2: color-mix(in srgb, ${selectedTheme.colors.base06} 12%, transparent);
        --message-hover: color-mix(in srgb, ${selectedTheme.colors.base06} 3%, transparent);

        --accent-1: ${selectedTheme.colors.base08};
        --accent-2: ${selectedTheme.colors.base11};
        --accent-3: ${selectedTheme.colors.base12};
        --accent-4: ${selectedTheme.colors.base13};
        --accent-5: ${selectedTheme.colors.base14};
        --accent-new: ${selectedTheme.colors.base09};

        --mention: linear-gradient(to right, color-mix(in srgb, ${selectedTheme.colors.base11}, transparent 90%) 40%, transparent);
        --mention-hover: linear-gradient(to right, color-mix(in srgb, ${selectedTheme.colors.base11}, transparent 95%) 40%, transparent);
        --reply: linear-gradient(to right, color-mix(in srgb, ${selectedTheme.colors.base04}, transparent 90%) 40%, transparent);
        --reply-hover: linear-gradient(to right, color-mix(in srgb, ${selectedTheme.colors.base04}, transparent 95%) 40%, transparent);

        --online: ${selectedTheme.colors.base14};
        --dnd: ${selectedTheme.colors.base11};
        --idle: ${selectedTheme.colors.base10};
        --streaming: ${selectedTheme.colors.base13};
        --offline: ${selectedTheme.colors.base03};

        --border-light: color-mix(in srgb, ${selectedTheme.colors.base06} 5%, transparent);
        --border: color-mix(in srgb, ${selectedTheme.colors.base06} 10%, transparent);
        --button-border: color-mix(in srgb, ${selectedTheme.colors.base06} 10%, transparent);

        --red-1: ${selectedTheme.colors.base08};
        --red-2: ${selectedTheme.colors.base08};
        --red-3: ${selectedTheme.colors.base08};
        --red-4: ${selectedTheme.colors.base08};
        --red-5: ${selectedTheme.colors.base08};

        --green-1: ${selectedTheme.colors.base11};
        --green-2: ${selectedTheme.colors.base11};
        --green-3: ${selectedTheme.colors.base11};
        --green-4: ${selectedTheme.colors.base11};
        --green-5: ${selectedTheme.colors.base11};

        --blue-1: ${selectedTheme.colors.base13};
        --blue-2: ${selectedTheme.colors.base13};
        --blue-3: ${selectedTheme.colors.base13};
        --blue-4: ${selectedTheme.colors.base13};
        --blue-5: ${selectedTheme.colors.base13};

        --yellow-1: ${selectedTheme.colors.base10};
        --yellow-2: ${selectedTheme.colors.base10};
        --yellow-3: ${selectedTheme.colors.base10};
        --yellow-4: ${selectedTheme.colors.base10};
        --yellow-5: ${selectedTheme.colors.base10};

        --orange-1: ${selectedTheme.colors.base09};
        --orange-2: ${selectedTheme.colors.base09};
        --orange-3: ${selectedTheme.colors.base09};
        --orange-4: ${selectedTheme.colors.base09};
        --orange-5: ${selectedTheme.colors.base09};

        --purple-1: ${selectedTheme.colors.base14};
        --purple-2: ${selectedTheme.colors.base14};
        --purple-3: ${selectedTheme.colors.base14};
        --purple-4: ${selectedTheme.colors.base14};
        --purple-5: ${selectedTheme.colors.base14};

        /* Bind internal Discord variables to our dynamic theme */
        --text-muted: var(--text-3);
        --text-normal: var(--text-2);
        --channels-default: var(--text-2);
        --interactive-normal: var(--text-3);
        --interactive-hover: var(--text-2);
        --interactive-active: var(--accent-2);
        --header-primary: var(--text-1);
        --header-secondary: var(--text-3);
        --text-link: var(--blue-2);
        --info-warning-foreground: var(--yellow-2);
        --info-danger-foreground: var(--red-2);
        --status-danger: var(--red-2);
        --status-warning: var(--yellow-2);
        --status-positive: var(--green-2);
    }
  '';
}
