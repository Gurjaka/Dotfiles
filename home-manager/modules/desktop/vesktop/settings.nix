{ theme, ... }:
{
  xdg.configFile."vesktop/settings/settings.json".text = ''
      {
        "autoUpdate": true,
        "autoUpdateNotification": true,
        "useQuickCss": true,
        "themeLinks": [],
        "enabledThemes": [
            "${theme}.css"
        ],
        "enableReactDevtools": false,
        "frameless": false,
        "transparent": false,
        "winCtrlQ": false,
        "disableMinSize": false,
        "winNativeTitleBar": false,
        "plugins": {
            "ChatInputButtonAPI": {
                "enabled": true
            },
            "CommandsAPI": {
                "enabled": true
            },
            "MemberListDecoratorsAPI": {
                "enabled": false
            },
            "MessageAccessoriesAPI": {
                "enabled": true
            },
            "MessageDecorationsAPI": {
                "enabled": false
            },
            "MessageEventsAPI": {
                "enabled": true
            },
            "MessagePopoverAPI": {
                "enabled": true
            },
            "MessageUpdaterAPI": {
                "enabled": true
            },
            "ServerListAPI": {
                "enabled": true
            },
            "SettingsStoreAPI": {
                "enabled": false
            },
            "AlwaysAnimate": {
                "enabled": false
            },
            "AlwaysTrust": {
                "enabled": false
            },
            "AnonymiseFileNames": {
                "enabled": false
            },
            "AppleMusicRichPresence": {
                "enabled": false
            },
            "WebRichPresence (arRPC)": {
                "enabled": false
            },
            "AutomodContext": {
                "enabled": false
            },
            "BANger": {
                "enabled": false
            },
            "BetterFolders": {
                "enabled": false,
                "sidebar": true,
                "showFolderIcon": 1,
                "closeAllHomeButton": false,
                "keepIcons": false,
                "closeAllFolders": false,
                "forceOpen": false,
                "sidebarAnim": true,
                "closeOthers": false
            },
            "BetterGifAltText": {
                "enabled": false
            },
            "BetterGifPicker": {
                "enabled": true
            },
            "BetterNotesBox": {
                "enabled": true,
                "hide": false
            },
            "BetterRoleContext": {
                "enabled": true
            },
            "BetterRoleDot": {
                "enabled": true,
                "bothStyles": false,
                "copyRoleColorInProfilePopout": false
            },
            "BetterSessions": {
                "enabled": true,
                "backgroundCheck": false
            },
            "BetterSettings": {
                "enabled": true,
                "disableFade": true,
                "eagerLoad": true
            },
            "BetterUploadButton": {
                "enabled": true
            },
            "BiggerStreamPreview": {
                "enabled": true
            },
            "BlurNSFW": {
                "enabled": true,
                "blurAmount": 10
            },
            "CallTimer": {
                "enabled": true
            },
            "ClearURLs": {
                "enabled": true
            },
            "ClientTheme": {
                "enabled": false
            },
            "ColorSighted": {
                "enabled": false
            },
            "ConsoleShortcuts": {
                "enabled": false
            },
            "CopyEmojiMarkdown": {
                "enabled": false
            },
            "CopyUserURLs": {
                "enabled": false
            },
            "CrashHandler": {
                "enabled": false
            },
            "CtrlEnterSend": {
                "enabled": false,
                "submitRule": "ctrl+enter",
                "sendMessageInTheMiddleOfACodeBlock": true
            },
            "CustomRPC": {
                "enabled": false
            },
            "CustomIdle": {
                "enabled": false
            },
            "Dearrow": {
                "enabled": false
            },
            "Decor": {
                "enabled": false
            },
            "DisableCallIdle": {
                "enabled": true
            },
            "DontRoundMyTimestamps": {
                "enabled": false
            },
            "EmoteCloner": {
                "enabled": true
            },
            "Experiments": {
                "enabled": false
            },
            "F8Break": {
                "enabled": false
            },
            "FakeNitro": {
                "enabled": true,
                "enableEmojiBypass": true,
                "enableStickerBypass": true,
                "enableStreamQualityBypass": true,
                "transformStickers": true,
                "transformEmojis": true,
                "transformCompoundSentence": false
            },
            "FakeProfileThemes": {
                "enabled": true,
                "nitroFirst": true
            },
            "FavoriteEmojiFirst": {
                "enabled": true
            },
            "FavoriteGifSearch": {
                "enabled": true
            },
            "FixCodeblockGap": {
                "enabled": true
            },
            "FixSpotifyEmbeds": {
                "enabled": true
            },
            "FixYoutubeEmbeds": {
                "enabled": true
            },
            "ForceOwnerCrown": {
                "enabled": true
            },
            "FriendInvites": {
                "enabled": false
            },
            "FriendsSince": {
                "enabled": false
            },
            "GameActivityToggle": {
                "enabled": false
            },
            "GifPaste": {
                "enabled": false
            },
            "GreetStickerPicker": {
                "enabled": false
            },
            "HideAttachments": {
                "enabled": false
            },
            "iLoveSpam": {
                "enabled": false
            },
            "IgnoreActivities": {
                "enabled": false
            },
            "ImageLink": {
                "enabled": false
            },
            "ImageZoom": {
                "enabled": false
            },
            "ImplicitRelationships": {
                "enabled": false
            },
            "InvisibleChat": {
                "enabled": true,
                "savedPasswords": "password, Password"
            },
            "KeepCurrentChannel": {
                "enabled": false
            },
            "LastFMRichPresence": {
                "enabled": false
            },
            "LoadingQuotes": {
                "enabled": false
            },
            "MaskedLinkPaste": {
                "enabled": false
            },
            "MemberCount": {
                "enabled": false
            },
            "MessageClickActions": {
                "enabled": false
            },
            "MessageLatency": {
                "enabled": false
            },
            "MessageLinkEmbeds": {
                "enabled": false
            },
            "MessageLogger": {
                "enabled": false
            },
            "MessageTags": {
                "enabled": false
            },
            "MoreCommands": {
                "enabled": false
            },
            "MoreKaomoji": {
                "enabled": false
            },
            "MoreUserTags": {
                "enabled": false
            },
            "Moyai": {
                "enabled": false
            },
            "MutualGroupDMs": {
                "enabled": false
            },
            "NewGuildSettings": {
                "enabled": false
            },
            "NoBlockedMessages": {
                "enabled": true,
                "ignoreBlockedMessages": false
            },
            "NoDefaultHangStatus": {
                "enabled": false
            },
            "NoDevtoolsWarning": {
                "enabled": false
            },
            "NoF1": {
                "enabled": false
            },
            "NoMosaic": {
                "enabled": false
            },
            "NoOnboardingDelay": {
                "enabled": false
            },
            "NoPendingCount": {
                "enabled": false
            },
            "NoProfileThemes": {
                "enabled": false
            },
            "NoReplyMention": {
                "enabled": false
            },
            "NoScreensharePreview": {
                "enabled": false
            },
            "NoServerEmojis": {
                "enabled": false
            },
            "NoTypingAnimation": {
                "enabled": false
            },
            "NoUnblockToJump": {
                "enabled": false
            },
            "NormalizeMessageLinks": {
                "enabled": false
            },
            "NotificationVolume": {
                "enabled": true,
                "notificationVolume": 75
            },
            "NSFWGateBypass": {
                "enabled": false
            },
            "OnePingPerDM": {
                "enabled": true
            },
            "oneko": {
                "enabled": false
            },
            "OpenInApp": {
                "enabled": false
            },
            "OverrideForumDefaults": {
                "enabled": false
            },
            "PartyMode": {
                "enabled": false
            },
            "PauseInvitesForever": {
                "enabled": false
            },
            "PermissionFreeWill": {
                "enabled": true,
                "lockout": true,
                "onboarding": true
            },
            "PermissionsViewer": {
                "enabled": true
            },
            "petpet": {
                "enabled": false
            },
            "PictureInPicture": {
                "enabled": false
            },
            "PinDMs": {
                "enabled": true,
                "dmSectioncollapsed": false
            },
            "PlainFolderIcon": {
                "enabled": false
            },
            "PlatformIndicators": {
                "enabled": false
            },
            "PreviewMessage": {
                "enabled": false
            },
            "PronounDB": {
                "enabled": false
            },
            "QuickMention": {
                "enabled": false
            },
            "QuickReply": {
                "enabled": false
            },
            "ReactErrorDecoder": {
                "enabled": false
            },
            "ReadAllNotificationsButton": {
                "enabled": true
            },
            "RelationshipNotifier": {
                "enabled": false
            },
            "ReplaceGoogleSearch": {
                "enabled": false
            },
            "ReplyTimestamp": {
                "enabled": false
            },
            "RevealAllSpoilers": {
                "enabled": false
            },
            "ReverseImageSearch": {
                "enabled": false
            },
            "ReviewDB": {
                "enabled": false
            },
            "RoleColorEverywhere": {
                "enabled": false
            },
            "SearchReply": {
                "enabled": false
            },
            "SecretRingToneEnabler": {
                "enabled": false
            },
            "Summaries": {
                "enabled": false
            },
            "SendTimestamps": {
                "enabled": false
            },
            "ServerInfo": {
                "enabled": false
            },
            "ServerListIndicators": {
                "enabled": false
            },
            "ShikiCodeblocks": {
                "enabled": false
            },
            "ShowAllMessageButtons": {
                "enabled": false
            },
            "ShowConnections": {
                "enabled": false
            },
            "ShowHiddenChannels": {
                "enabled": true,
                "showMode": 0,
                "hideUnreads": true
            },
            "ShowHiddenThings": {
                "enabled": false
            },
            "ShowMeYourName": {
                "enabled": true,
                "displayNames": false,
                "mode": "user-nick",
                "inReplies": false
            },
            "ShowTimeoutDuration": {
                "enabled": false
            },
            "SilentMessageToggle": {
                "enabled": false,
                "persistState": false,
                "autoDisable": true
            },
            "SilentTyping": {
                "enabled": true,
                "isEnabled": true,
                "showIcon": false
            },
            "SortFriendRequests": {
                "enabled": false
            },
            "SpotifyControls": {
                "enabled": true,
                "hoverControls": false
            },
            "SpotifyCrack": {
                "enabled": true,
                "noSpotifyAutoPause": true,
                "keepSpotifyActivityOnIdle": false
            },
            "SpotifyShareCommands": {
                "enabled": true
            },
            "StartupTimings": {
                "enabled": false
            },
            "StreamerModeOnStream": {
                "enabled": false
            },
            "SuperReactionTweaks": {
                "enabled": false
            },
            "TextReplace": {
                "enabled": false
            },
            "ThemeAttributes": {
                "enabled": false
            },
            "TimeBarAllActivities": {
                "enabled": false
            },
            "Translate": {
                "enabled": false
            },
            "TypingIndicator": {
                "enabled": false
            },
            "TypingTweaks": {
                "enabled": false
            },
            "Unindent": {
                "enabled": false
            },
            "UnlockedAvatarZoom": {
                "enabled": false
            },
            "UnsuppressEmbeds": {
                "enabled": false
            },
            "UrbanDictionary": {
                "enabled": false
            },
            "UserVoiceShow": {
                "enabled": false
            },
            "USRBG": {
                "enabled": false
            },
            "ValidReply": {
                "enabled": false
            },
            "ValidUser": {
                "enabled": false
            },
            "VoiceChatDoubleClick": {
                "enabled": false
            },
            "VcNarrator": {
                "enabled": false
            },
            "VencordToolbox": {
                "enabled": false
            },
            "ViewIcons": {
                "enabled": true
            },
            "ViewRaw": {
                "enabled": false
            },
            "VoiceDownload": {
                "enabled": false
            },
            "VoiceMessages": {
                "enabled": false
            },
            "WatchTogetherAdblock": {
                "enabled": false
            },
            "WebKeybinds": {
                "enabled": false
            },
            "WebScreenShareFixes": {
                "enabled": false
            },
            "WhoReacted": {
                "enabled": true
            },
            "Wikisearch": {
                "enabled": false
            },
            "XSOverlay": {
                "enabled": false
            },
            "NoTrack": {
                "enabled": false,
                "disableAnalytics": true
            },
            "WebContextMenus": {
                "enabled": false,
                "addBack": true
            },
            "Settings": {
                "enabled": false,
                "settingsLocation": "aboveNitro"
            },
            "UserSettingsAPI": {
                "enabled": true
            },
            "SupportHelper": {
                "enabled": false
            }
        },
        "notifications": {
            "timeout": 5000,
            "position": "bottom-right",
            "useNative": "not-focused",
            "logLimit": 50
        },
        "cloud": {
            "authenticated": false,
            "url": "https://api.vencord.dev/",
            "settingsSync": false,
            "settingsSyncVersion": 1719237709949
        }
    }'';
}
