#tag Menu
Begin Menu FirstWindowMenuBar
   Begin DesktopMenuItem VaultMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Vault"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem VaultNew
         SpecialMenu = 0
         Index = -2147483648
         Text = "New Vault..."
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem VaultImport
         SpecialMenu = 0
         Index = -2147483648
         Text = "Import Vault..."
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem UntitledSeparator
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopQuitMenuItem VaultQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.kFileQuit"
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin DesktopMenuItem HelpMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "&Help"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem ReadmeOnGithub
         SpecialMenu = 0
         Index = -2147483648
         Text = "Readme on Github"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem Separator4
         SpecialMenu = 0
         Index = -2147483648
         Text = "-"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopMenuItem HelpAbout
         SpecialMenu = 0
         Index = -2147483648
         Text = "About"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
