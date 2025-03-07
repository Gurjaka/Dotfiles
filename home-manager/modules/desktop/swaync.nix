{
  services.swaync = {
    enable = true;
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";

      positionX = "right";
      positionY = "top";
      control-center-positionX = "left";
      control-center-positionY = "none";
      control-center-margin-top = 8;
      control-center-margin-bottom = 8;
      control-center-margin-right = 8;
      control-center-margin-left = 7;
      control-center-width = 500;
      control-center-height = 1200;
      fit-to-screen = true;

      layer = "overlay";
      control-center-layer = "overlay";
      cssPriority = "user";
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      notification-inline-replies = true;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "notifications"
        "mpris"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = false;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
      };
    };
    style = ''
      @define-color cc-bg #2E3440;
      @define-color noti-bg #2E3440;
      @define-color noti-bg-darker #242933;
      @define-color noti-bg-hover rgb(27, 27, 43);
      @define-color noti-bg-focus rgba(27, 27, 27, 0.6);
      @define-color text-color #f9f5d7;
      @define-color text-color-disabled #bdae93;
      @define-color bg-selected #3B4252;

      * {
          font-family: JetBrains Mono Medium;
          font-weight: bold;
          font-size: 15px
      }

      .control-center .notification-row:focus,
      .control-center .notification-row:hover {
          opacity: 1;
          background: @noti-bg-darker
      }

      .notification-row {
          outline: none;
          margin: 10px;
          padding: 0;
      }

      .notification {
          background: transparent;
          margin: 0px;
      }

      .notification-content {
          background: @cc-bg;
          padding: 4px;
          border-radius: 0px;
          margin: 0;
      }

      .notification-action {
          color: #5E81AC;

          border-top: none;
          border-radius: 0px;
          background: #32302F;
      }

      .notification-default-action:hover,
      .notification-action:hover {
          color: #81A1C1;
          background: #32302F;
      }

      .summary {
          padding-top: 7px;
          font-size: 13px;
          color: #81A1C1;
      }

      .time {
          font-size: 11px;
          color: #81A1C1;
          margin-right: 24px
      }

      .body {
          font-size: 12px;
          color: #81A1C1;
      }

      .control-center {
          background: @cc-bg;

          border-radius: 0px;
      }

      .control-center-list {
          background: transparent
      }

      .control-center-list-placeholder {
          opacity: .5
      }

      .floating-notifications {
          background: transparent
      }

      .blank-window {
          background: alpha(black, 0.1)
      }

      .widget-title {
          color: #81A1C1;
          background: @noti-bg-darker;
          padding: 5px 10px;
          margin: 10px 10px 5px 10px;
          font-size: 1.5rem;

          border-radius: 4px;
      }

      .widget-title>button {
          font-size: 1rem;
          color: #81A1C1;
          text-shadow: none;
          background: @noti-bg;
          box-shadow: none;

          border-radius: 4px;
      }

      .widget-title>button:hover {
          background: #81A1C1;
          color: #81A1C1;
      }

      .widget-dnd {
          background: @noti-bg-darker;
          padding: 5px 10px;
          margin: 5px 10px 10px 10px;

          border-radius: 4px;
          font-size: large;
          color: #81A1C1;
      }

      .widget-dnd>switch {
          border-radius: 4px;

          background: #2E3440;
      }

      .widget-dnd>switch:checked {
          background: #5E81AC;

      }

      .widget-dnd>switch slider {
          background: @cc-bg;
          border-radius: 4px
      }

      .widget-dnd>switch:checked slider {
          background: @cc-bg;
          border-radius: 4px
      }

      .widget-label {
          margin: 10px 10px 5px 10px;
      }

      .widget-label>label {
          font-size: 1rem;
          color: @text-color;
      }

      .widget-mpris {
          color: @text-color;
          background: @noti-bg-darker;
          padding: 10px 10px 0px 10px;
          margin: 5px 10px 20px 10px;
          border-radius: 4px;
      }

      .widget-mpris > box > button {
          border-radius: 4px;
      }

      .widget-mpris-player {
          padding: 5px 10px;
          margin: 10px
      }

      .widget-mpris-title {
          font-weight: 700;
          font-size: 1.25rem
      }

      .widget-mpris-subtitle {
          font-size: 1.1rem
      }

      .widget-buttons-grid {
          font-size: x-large;
          padding: 5px;
          margin: 5px 10px 10px 10px;
          border-radius: 4px;
          background: @noti-bg-darker;
      }

      .widget-buttons-grid>flowbox>flowboxchild>button {
          margin: 3px;
          background: @cc-bg;
          border-radius: 4px;
          color: #32302F;
      }

      .widget-buttons-grid>flowbox>flowboxchild>button:hover {
          background: #d79921;
          color: @cc-bg;
      }

      .widget-menubar>box>.menu-button-bar>button {
          border: none;
          background: transparent
      }

      .topbar-buttons>button {
          border: none;
          background: transparent
      }

    '';
  };
}
