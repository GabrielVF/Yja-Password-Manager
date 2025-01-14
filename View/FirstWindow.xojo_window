#tag DesktopWindow
Begin DesktopWindow FirstWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   361
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   2132236287
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Y,ja... Password Manager"
   Type            =   0
   Visible         =   True
   Width           =   253
   Begin DesktopTextField VaultField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   24
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   231
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   213
   End
   Begin DesktopTextField PasswordField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   24
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   283
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   213
   End
   Begin DesktopButton Button_open
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Open"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   81
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   320
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin DesktopButton CancelButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Exit"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   163
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   320
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin DesktopCanvas LogoCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   519512063
      Enabled         =   True
      Height          =   128
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   63
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Visible         =   True
      Width           =   128
   End
   Begin DesktopLabel Label_newVault
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "New Vault"
      TextAlignment   =   2
      TextColor       =   &c0433FF00
      Tooltip         =   ""
      Top             =   315
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   56
   End
   Begin DesktopLabel Label_Yja
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   18.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Yes, just another..."
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   160
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   213
   End
   Begin DesktopLabel Label_title
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   14.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Password Manager, but worse."
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   183
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   213
   End
   Begin DesktopLabel Label_vaultName
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   13.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "VAULT NAME"
      TextAlignment   =   0
      TextColor       =   &c80808000
      Tooltip         =   ""
      Top             =   215
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   213
   End
   Begin DesktopLabel Label_password
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   13.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "PASSWORD"
      TextAlignment   =   0
      TextColor       =   &c80808000
      Tooltip         =   ""
      Top             =   267
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   213
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Moved()
		  //update the window position.
		  App.Top = Me.Top
		  App.Left = Me.Left
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  
		  // Path to the configuration file that stores the last window position.
		  Var f As FolderItem = SpecialFolder.ApplicationData.Child("YJAPasswordManager").Child("yjapm.conf")
		  
		  Var top, left As Integer
		  Var t As TextInputStream 
		  
		  // Check if the configuration file exists.
		  If f <> Nil And f.Exists Then
		    Try
		      // Open the configuration file and read its content.
		      t = TextInputStream.Open(f)
		      t.Encoding = Encodings.UTF8
		      
		      // Split the content to extract top and left positions.
		      Var positionArray() As String = Split(t.ReadLine, "|")
		      t.Close
		      
		      top = Val(positionArray(0))
		      left = Val(positionArray(1))
		      
		      // Validate the positions and set the window location.
		      If top > 0 And top < Screen(0).Height Then
		        If left > 0 And left < Screen(0).Width Then
		          Me.Top = top
		          Me.Left = left
		        End If
		      End If
		      
		    Catch e As IOException
		      If t <> Nil Then t.Close 
		    End Try
		  End If
		  
		  
		  
		  
		  'Var f As FolderItem = SpecialFolder.ApplicationData.Child("YJAPasswordManager")
		  'f = f.Child("yjapm.conf")
		  'Var top, left As Integer
		  '
		  '// La posición de la ventana debe ser la misma que cuando se cerró el programa la última vez
		  'If f <> Nil Then
		  'Var anArray(-1) as String
		  'If f.Exists Then
		  'Var t As TextInputStream
		  'Try
		  't = TextInputStream.Open(f)
		  't.Encoding = Encodings.UTF8
		  'anArray = Split(t.ReadLine, "|")
		  'top = CDbl(anArray(0))
		  'left = CDbl(anArray(1))
		  '
		  '
		  'If top > 0 And top<Screen(0).Height Then
		  'If left > 0 And left<Screen(0).Width Then
		  'Me.Top = top
		  'Me.Left = left
		  'End
		  'End
		  '
		  'Catch e As IOException
		  't.Close
		  'End Try
		  'End If
		  'End If
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
		  Var AboutW As New WindowAbout
		  AboutW.ShowModal
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReadmeOnGithub() As Boolean Handles ReadmeOnGithub.Action
		  ShowURL("https://github.com/GabrielVF/Yja-Password-Manager")
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VaultImport() As Boolean Handles VaultImport.Action
		  Var vaultFileName As String
		  Var dlg As New OpenDialog
		  Var f As FolderItem // Backup file
		  Var f2 As FolderItem // Destination folder
		  
		  dlg.InitialDirectory = SpecialFolder.Documents
		  dlg.Title = "Select the backup file."
		  dlg.Filter = FileType_Backup.BackupFile.Name
		  f = dlg.ShowModal
		  
		  If f <> Nil Then
		    // Prompt the user for the decryption password.
		    Var passwordW As New PasswordWindow
		    passwordW.ShowModal
		    
		    // Open the selected backup file as a SQLite database.
		    Var mDb As New SQLiteDatabase
		    mDb.DatabaseFile = f
		    mDb.EncryptionKey = "aes256:" + App.StringObfuscator(App.userPassword, "********")
		    
		    If mDb.Connect Then
		      mDb.Decrypt
		      
		      Try
		        // Read the identifier from the backup file.
		        Var ps As SQLitePreparedStatement = mDb.Prepare("SELECT * FROM Identifier") 
		        Var data As RecordSet = ps.SQLSelect()
		        
		        If mDb.Error Then
		          mDb.Encrypt("aes256:" + App.StringObfuscator(App.userPassword, "********"))
		          mDb.Close
		          MessageBox("Error restoring the backup. CODE 459886")
		          Return False
		        End If
		        
		        // Process the identifier if it exists.
		        If data <> Nil Then
		          While Not data.EOF
		            vaultFileName = data.Field("FileName").StringValue
		            data.MoveNext
		          Wend
		          data.Close
		          
		          mDb.Encrypt("aes256:" + App.StringObfuscator(App.userPassword, "********"))
		          mDb.Close
		          
		          // Destination folder for the restored backup.
		          f2 = SpecialFolder.ApplicationData.Child("YJAPasswordManager").Child(vaultFileName)
		          
		          If Not f2.Exists Then
		            // Restore the backup file if it doesn't already exist.
		            Var f3 As FolderItem = SpecialFolder.ApplicationData.Child("YJAPasswordManager")
		            f.CopyFileTo(f3)
		            f3 = f3.Child(f.Name)
		            f3.Name = vaultFileName
		            MessageBox("Backup successfully restored.")
		          Else
		            // If the vault exists, confirm overwriting.
		            Var dialog As New MessageDialog
		            dialog.IconType = MessageDialog.IconTypes.Caution
		            dialog.Message = "Vault already exists"
		            dialog.Explanation = "That vault already exists, it will be overwritten. Do you want to continue?"
		            dialog.ActionButton.Caption ="Overwrite it"
		            dialog.CancelButton.Caption ="Cancel"
		            dialog.CancelButton.Visible = True
		            
		            If dialog.ShowModal.Caption = "Overwrite it" Then
		              f2.Delete
		              Var f3 As FolderItem = SpecialFolder.ApplicationData.Child("YJAPasswordManager")
		              f.CopyFileTo(f3)
		              f3 = f3.Child(f.Name)
		              f3.Name = vaultFileName
		              MessageBox("Backup successfully restored.")
		            End If
		          End If
		        End If
		      Catch e As RuntimeException
		        // Handle unexpected runtime errors.
		        mDb.Encrypt("aes256:" + App.StringObfuscator(App.userPassword, "********"))
		        mDb.Close
		        MessageBox("An unexpected error occurred while restoring the backup.")
		        Return False
		      End Try
		    Else
		      // Handle connection failure.
		      MessageBox("Error restoring the backup. Unable to connect to the database.")
		      Return False
		    End If
		  Else
		    // User cancelled the dialog.
		    MessageBox("Backup restoration cancelled.")
		  End If
		  
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VaultNew() As Boolean Handles VaultNew.Action
		  // Create and display the "New User" window as a modal dialog.
		  // Position it slightly offset from the current window's position.
		  Var NewVaultW As New NewVaultWindow
		  
		  NewVaultW.Left = Self.Left + 5
		  NewVaultW.Top = Self.Top + 5
		  NewVaultW.ShowModal
		  
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events Button_open
	#tag Event
		Sub Pressed()
		  // Retrieve user input from the fields.
		  Var vaultName As String = VaultField.Text.Trim
		  Var userPassword As String = PasswordField.Text.Trim
		  
		  // Validate user input.
		  If vaultName = "" Or userPassword = "" Then
		    MessageBox("Username or password cannot be empty. Please provide valid credentials.")
		    Return
		  End If
		  
		  // Attempt to connect to the database and decrypt it with the provided credentials.
		  If App.ConnectToDBAndDecrypt(vaultName, userPassword) Then
		    // Load data from the database if the connection is successful.
		    If App.LoadData Then
		      // Ensure the database is securely closed and encrypted before proceeding.
		      If App.CloseDBAndEncrypt(userPassword) Then
		        // Open the Notes window and position it relative to the current window.
		        Var notesW As New NotesWindow
		        notesW.Left = Self.Left
		        notesW.Top = Self.Top
		        notesW.Title = "Vault: "+ vaultName
		        notesW.Show
		        Self.Close
		      End If
		    End If
		  End If
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label_newVault
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Var NewVaultW As New NewVaultWindow
		  NewVaultW.Left = Self.Left+5
		  NewVaultW.Top = Self.Top+5
		  NewVaultW.ShowModal
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.TextColor = RGB(4,45,255)
		  MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.TextColor = RGB(4,51,255)
		  MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
