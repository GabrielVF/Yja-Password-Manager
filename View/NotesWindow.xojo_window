#tag DesktopWindow
Begin DesktopWindow NotesWindow
   Backdrop        =   0
   BackgroundColor =   &c00000000
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   Height          =   361
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   465
   MaximumWidth    =   405
   MenuBar         =   1243326463
   MenuBarVisible  =   True
   MinimumHeight   =   361
   MinimumWidth    =   253
   Resizeable      =   True
   Title           =   "Y,ja... notes"
   Type            =   0
   Visible         =   True
   Width           =   253
   Begin DesktopButton NewButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "New..."
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   153
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   319
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopTextField SearchField
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
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "SEARCH"
      TextAlignment   =   0
      TextColor       =   &cC0C0C000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   213
   End
   Begin DesktopListBox NotesBox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   18.0
      FontUnit        =   0
      GridLineStyle   =   1
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   259
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "NOTES\r\n"
      Italic          =   True
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   48
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   213
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton DeleteButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   61
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   319
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  
		  // Clean up any data or resources associated with the application.
		  App.CleanData
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  
		  // Handle key presses based on their ASCII values.
		  Select Case AscB(Key)
		  Case 3, 13 // ENTER or RETURN key
		    If NotesBox.SelectedRowIndex <> -1 Then
		      // If an item is selected, edit it.
		      EditItem
		    Else
		      // If no item is selected, create a new item.
		      NewItem
		    End If
		    
		  Case Else
		    Return False
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MenuBarSelected()
		  If NotesBox.SelectedRowIndex = -1 Then
		    NoteCopyusername.Enabled = False
		    NoteCopyPassword.Enabled = False
		    NoteDelete.Enabled = False
		    NoteEdit.Enabled = False
		  Else
		    NoteCopyusername.Enabled = True
		    NoteCopyPassword.Enabled = True
		    NoteDelete.Enabled = True
		    NoteEdit.Enabled = True
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Moved()
		  //update the window position.
		  App.Top = Me.Top
		  App.Left = Me.Left
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  LoadItemsInVault
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
		  Try
		    Var aboutW As New WindowAbout
		    aboutW.Show
		    
		    Return True
		    
		  Catch e As RuntimeException
		    Return False
		  End Try
		  
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NoteCopyPassword() As Boolean Handles NoteCopyPassword.Action
		  If NotesBox.SelectedRowIndex <> -1 Then
		    Var n As Note = NotesBox.RowTagAt(NotesBox.SelectedRowIndex)
		    
		    Var c As New Clipboard
		    Try
		      c.Text = App.GetDetailsFromDB(n.Title)
		    Catch e As RuntimeException
		      MessageBox("An error occurred while copying the details to the clipboard.")
		      Return False
		    Finally
		      c.Close 
		    End Try
		    
		    Return True
		    
		  Else
		    MessageBox("No item selected. Please select an item to copy its details.")
		    Return False
		  End If
		  
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NoteCopyusername() As Boolean Handles NoteCopyusername.Action
		  If NotesBox.SelectedRowIndex <> -1 Then
		    Try
		      Var n As Note = NotesBox.RowTagAt(NotesBox.SelectedRowIndex)
		      
		      Var c As New Clipboard
		      c.Text = n.User
		      c.Close
		      
		      Return True
		      
		    Catch e As RuntimeException
		      MessageBox("An error occurred while copying the username to the clipboard: " + e.Message)
		      Return False
		    End Try
		  Else
		    MessageBox("No item selected. Please select an item to copy the username.")
		    Return False
		  End If
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NoteDelete() As Boolean Handles NoteDelete.Action
		  
		  If NotesBox.SelectedRowIndex <> -1 Then
		    Var n As Note = NotesBox.RowTagAt(NotesBox.SelectedRowIndex)
		    
		    // Ask for confirmation before deleting the item.
		    Var confirmation As New MessageDialog
		    confirmation.IconType = MessageDialog.IconTypes.Caution
		    confirmation.Message = "Delete Confirmation"
		    confirmation.Explanation = "Are you sure you want to delete this item? This action cannot be undone."
		    confirmation.ActionButton.Caption ="Delete"
		    confirmation.CancelButton.Visible = True
		    
		    If confirmation.ShowModal.Caption = "Delete" Then
		      App.DeleteItemFromDB(n.Title)
		      
		      LoadItemsInVault
		      
		      Return True 
		    Else
		      // User chose not to delete the item.
		      Return False
		    End If
		    
		  Else
		    MessageBox("No item selected. Please select an item to delete.")
		    Return False
		  End If
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NoteEdit() As Boolean Handles NoteEdit.Action
		  EditItem
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
		Function VaultChangenamepassword() As Boolean Handles VaultChangenamepassword.Action
		  Var changeVaultW As New ChangeUserPasswordWindow
		  changeVaultW.VaultField.Text = app.StringObfuscator(app.userName, app.dbFile.Name)
		  changeVaultW.Show
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VaultClose() As Boolean Handles VaultClose.Action
		  App.CleanData
		  
		  Var firstW As New FirstWindow
		  firstW.Left = Self.Left
		  firstW.Top = Self.Top
		  
		  firstW.Show
		  Self.Close
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VaultDelete() As Boolean Handles VaultDelete.Action
		  // Display a confirmation dialog before deleting the vault.
		  Var confirmationDialog As New MessageDialog
		  confirmationDialog.IconType = MessageDialog.IconTypes.Caution
		  confirmationDialog.Message = "Delete Confirmation"
		  confirmationDialog.Explanation = "If you continue, this Vault and all its notes will be permanently deleted." + EndOfLine + "Do you want to continue?"
		  confirmationDialog.ActionButton.Caption = "Delete"
		  confirmationDialog.CancelButton.Visible = True
		  
		  // Show the confirmation dialog and handle the user's response.
		  If confirmationDialog.ShowModal.Caption = "Delete" Then
		    Try
		      App.dbfile.Remove
		      
		      App.CleanData
		      Var firstW As New FirstWindow
		      firstW.Show
		      Self.Close
		      Return True
		      
		    Catch e As IOException
		      MessageBox("An unexpected error occurred while deleting the vault." + e.Message)
		      Return False
		    Catch e2 As RuntimeException
		      MessageBox("An unexpected error occurred while deleting the vault." + e2.Message)
		      Return False
		    End Try
		  End If
		  
		  // Return False if the user cancels the operation.
		  Return False
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function VaultExport() As Boolean Handles VaultExport.Action
		  Var dlg As New SaveFileDialog
		  Var f As FolderItem
		  Var d As New Date
		  
		  // Set the initial directory, suggested file name, and dialog properties.
		  dlg.InitialFolder = SpecialFolder.Documents
		  dlg.SuggestedFileName = App.StringObfuscator(App.userName, App.dbFile.Name) + "_" + d.SQLDate + ".pmbk"
		  dlg.Title = "Select where to save the backup file"
		  dlg.Filter = FileType_Backup.BackupFile.Name
		  
		  f = dlg.ShowModal()
		  
		  If f <> Nil Then
		    Try
		      // If the file already exists, delete it before saving the backup.
		      If f.Exists Then
		        Try
		          f.Remove
		        Catch error As IOException
		          MessageBox("Error deleting existing file: " + error.Message)
		          Return False
		        End Try
		      End If
		      
		      // Copy the database file to the chosen location.
		      Try
		        App.dbFile.CopyTo(f)
		      Catch error As IOException
		        MessageBox("Error saving the backup file: " + error.Message)
		        Return False
		      End Try
		      
		      // Notify the user of the successful operation.
		      MessageBox("Backup saved successfully.")
		      Return True
		      
		    Catch e As RuntimeException
		      // Handle any unexpected errors.
		      MessageBox("An unexpected error occurred while saving the backup: " + e.Message)
		      Return False
		    End Try
		  Else
		    // User canceled the dialog.
		    MessageBox("Backup operation canceled.")
		    Return False
		  End If
		  
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub EditItem()
		  Var n As Note = NotesBox.RowTagAt(NotesBox.SelectedRowIndex)
		  
		  // Fetch the password from the database to avoid loading all passwords into memory.
		  n.Password = App.GetDetailsFromDB(n.Title)
		  
		  // Store the original title before editing, in case it is modified.
		  Var originalTitle As String = n.Title
		  
		  // Create and configure the edit window.
		  Var editWindow As New EditNoteWindow
		  editWindow.CurrentNote = n
		  editWindow.Title = "Y,ja... edit note"
		  editWindow.Left = Self.Left + (Self.Width - editWindow.Width)/2
		  editWindow.Top = Self.Top + 75
		  editWindow.ShowModal
		  
		  // Check if the note was updated in the edit window.
		  If editWindow.isUpdated Then
		    // Save the updated note to the database.
		    App.EditItemAndUpdateDB(editWindow.CurrentNote, originalTitle)
		    
		    // Reset the update flag in the edit window.
		    editWindow.isUpdated = False
		  End If
		  
		  LoadItemsInVault
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadItemsInVault()
		  NotesBox.RemoveAllRows
		  
		  For Each n As Note In App.Notes
		    NotesBox.AddRow(n.Title) // Add the note's title as a new row.
		    NotesBox.RowTagAt(NotesBox.LastAddedRowIndex) = n // Store the note object in the RowTag.
		  Next
		  
		  // Sort the NotesBox by the first column (Title) in ascending order.
		  NotesBox.ColumnSortDirectionAt(0) = DesktopListBox.SortDirections.Ascending
		  NotesBox.SortingColumn = 0
		  NotesBox.Sort
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewItem()
		  Var editW As New EditNoteWindow
		  editW.Title = "Y,ja... new note"
		  editW.Left = Self.Left + (Self.Width - editW.Width)/2
		  editW.Top = Self.Top + 75
		  
		  // Indicate that no current note is being edited (new item scenario).
		  editW.CurrentNote = Nil
		  
		  editW.ShowModal
		  
		  // Check if the user updated the item (added a new item).
		  If editW.isUpdated Then
		    Try
		      // Add the new item to the database.
		      App.AddItemToDB(editW.CurrentNote)
		      
		      // Reset the updated flag in the edit window.
		      editW.isUpdated = False
		      
		      LoadItemsInVault
		      
		    Catch e As RuntimeException
		      MessageBox("An error occurred while adding the new item: " + e.Message)
		    End Try
		  Else
		    // Reload the list in case any unrelated changes were made.
		    LoadItemsInVault
		  End If
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events NewButton
	#tag Event
		Sub Pressed()
		  NewItem
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SearchField
	#tag Event
		Sub TextChanged()
		  
		  // Retrieve the current text from the search field.
		  Var searchString As String = Me.Text.Trim
		  
		  // Clear the NotesBox and search for matching notes.
		  If searchString <> "" And searchString <> "SEARCH" Then
		    NotesBox.RemoveAllRows
		    
		    // Iterate through the list of notes and add matches to the NotesBox.
		    For Each n As Note In App.Notes
		      If n.Title.IndexOf(searchString, ComparisonOptions.CaseInsensitive) >= 0 Then
		        NotesBox.AddRow(n.Title, n.User)
		        NotesBox.RowTagAt(NotesBox.LastRowIndex) = n
		      End If
		    Next
		    
		    // Sort the NotesBox by the first column (Title) in ascending order.
		    NotesBox.ColumnSortDirectionAt(0) = DesktopListBox.SortDirections.Ascending
		    NotesBox.SortingColumn = 0
		    NotesBox.Sort
		    
		  ElseIf searchString = "SEARCH" Then
		    // Do nothing if the placeholder "SEARCH" is present.
		    
		  Else
		    // Reload all items into the NotesBox if the search field is empty.
		    LoadItemsInVault
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub FocusReceived()
		  Me.TextColor = RGB(0,0,0)
		  Me.Text = ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  Me.TextColor = RGB(192,192,192)
		  Me.Text = "SEARCH"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NotesBox
	#tag Event
		Sub DoublePressed()
		  EditItem
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If NotesBox.SelectedRowIndex <> -1 Then
		    base.AddMenu( New DesktopMenuItem( "'User ID' to clipboard" ) )
		    base.AddMenu( New DesktopMenuItem( "Password to clipboard" ) )
		    base.AddMenu( New DesktopMenuItem( MenuItem.TextSeparator ) )
		    base.AddMenu( New DesktopMenuItem( "Edit" ) )
		    base.AddMenu( New DesktopMenuItem( "Delete" ) )
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  If NotesBox.SelectedRowIndex <> -1 Then
		    
		    Var n As Note = Me.RowTagAt(Me.SelectedRowIndex)
		    
		    Select Case selectedItem.Text
		    case "'User ID' to clipboard"
		      Var p As New Clipboard
		      p.Text = n.User
		      p.Close
		    case "Password to clipboard"  
		      Var c As New Clipboard
		      c.Text = App.GetDetailsFromDB(n.Title)
		      c.Close
		    case "Edit"  
		      EditItem
		    case "Delete"
		      App.DeleteItemFromDB(n.Title)
		      LoadItemsInVault
		    End select
		    
		    Return True
		    
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  DeleteButton.Enabled = true
		End Function
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  DeleteButton.Enabled = False
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteButton
	#tag Event
		Sub Pressed()
		  Try
		    Var n As Note = NotesBox.RowTagAt(NotesBox.SelectedRowIndex)
		    App.DeleteItemFromDB(n.Title)
		    LoadItemsInVault
		    
		  Catch err As OutOfBoundsException
		    MessageBox("No item selected")
		  End Try
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
