#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Closing()
		  CleanData
		  
		  // Saves the current window position to a configuration file.
		  // This ensures the window position is preserved for the next application session.
		  Var configFile As FolderItem = SpecialFolder.ApplicationData.Child("YJAPasswordManager")
		  configFile = configFile.Child("yjapm.conf")
		  If configFile <> Nil Then
		    Try
		      Var outputStream As TextOutputStream = TextOutputStream.Create(configFile)
		      outputStream.Write(ConvertEncoding(Str(App.Top)+"|"+Str(App.Left), Encodings.UTF8))
		      outputStream = Nil
		    Catch e As IOException
		      // PENDING: Add specific error handling logic if needed.
		    End Try
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // Application startup logic, including command-line usage handling.
		  
		  App.AllowAutoQuit = True // Automatically quit the app when no windows are open.
		  
		  // Determine the application's configuration folder.
		  Var dbFile As FolderItem = SpecialFolder.ApplicationData.Child("YJAPasswordManager")
		  
		  // Create the folder if it does not exist.
		  If Not dbFile.Exists Then
		    dbFile.CreateAsFolder
		  End If
		  
		  // Command-line usage: open -a YjaPasswordManager --args 'vault name' 'item name'
		  // The expected arguments are:
		  //   args(0) - The vault name
		  //   args(1) - The item name to retrieve its password to clipboard
		  // NOTE: Command-line mode only supports vaults and notes with single-word names.
		  
		  var Temp as String = System.CommandLine.Replace(app.ExecutableFile.NativePath, "").Trim
		  var args() as String = Temp.Split(" ")
		  
		  // Command-line mode
		  If args.LastIndex = 1 Then
		    App.userName = args(0) // Extract the vault name
		    Var itemName As String = args(1) // Extract the item name.
		    
		    // Initialize the password window in command-line mode.
		    Var pW As New PasswordWindow
		    pW.isFromCommandLIne = True
		    pW.ShowModal
		    
		    // Retrieve the password associated with the item name.
		    Var clipboard As New Clipboard
		    clipboard.Text = App.GetDetailsFromDB(itemName, True) 
		    clipboard.Close 
		    
		    If clipboard.Text = "" Then
		      MessageBox("Invalid arguments. Vault or item not found.")
		    End
		    
		    // Handle Invalid command-line arguments
		  ElseIf args.Count > 1 Then
		    Var dialog As New MessageDialog
		    Var button As MessageDialogButton                    
		    dialog.IconType  = MessageDialog.IconTypes.Note  
		    dialog.Message = "Invalid command-line arguments"
		    dialog.Explanation = "Usage: open -a YjaPasswordManager --args 'vault name' 'item name'" + EndOfLine + _
		    "Example: open -a YJAPasswordManager --args Webs Amazon" + EndOfLine + _
		    "This command would retrieve your password for Amazon, stored in the 'Webs' vault, and copy it to the clipboard." + EndOfLine + _
		    "Note: Command-line mode only supports vaults and items with single-word names."
		    dialog.ActionButton.Caption ="OK"
		    button = dialog.ShowModal
		    
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItemToDB(Item As Note)
		  // Adds a new note item to the database.
		  // Item: A Note object containing the details (User, Title, and Password) to be stored in the database.
		  
		  If ConnectToDBAndDecrypt( _
		    App.StringObfuscator(userName, dbFile.Name), _
		    App.StringObfuscator(userPassword, dbFile.Name)) Then
		    
		    Try
		      Var ps As SQLitePreparedStatement = mDB.Prepare("INSERT INTO Notes (User, Title, Password) VALUES (?, ?, ?)") 
		      
		      ps.BindType(0, SQLitePreparedStatement.SQLITE_TEXT) 
		      ps.BindType(1, SQLitePreparedStatement.SQLITE_TEXT) 
		      ps.BindType(2, SQLitePreparedStatement.SQLITE_TEXT) 
		      
		      ps.Bind(0, Item.User)
		      ps.Bind(1, Item.Title)
		      ps.Bind(2, Item.Password)
		      
		      ps.ExecuteSQL
		      
		      If Not LoadData Then
		        MessageBox("Error connecting to the database.")
		      End If
		      
		      If Not CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name)) Then
		        MessageBox("Failed to close and encrypt the database.")
		      End If
		      
		    Catch error As RuntimeException
		      MessageBox("Unexpected Error: " + error.Message)
		      Call CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name))
		    End Try
		    
		  Else
		    MessageBox("Failed to connect to or decrypt the database.")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChangeNameOrPassword(newUserName As String, newUserPassword As String) As Boolean
		  // Changes the name or password of the database (Vault).
		  // Creates a new encrypted database with the new name and/or password, migrates the data, 
		  // and deletes the old database.
		  // Returns True if the operation is successful, False otherwise.
		  
		  // Generate the new hash-based filename for the database.
		  Var fileName As String
		  Var hash As String
		  hash = Crypto.Hash(newUserPassword+ newUserName, Crypto.Algorithm.SHA256)
		  fileName = EncodeHex(hash) + ".db"
		  
		  // Determine the path for the new database file.
		  Var dbFile As FolderItem = SpecialFolder.ApplicationData
		  dbFile = dbFile.Child("YJAPasswordManager").Child(fileName)
		  
		  // Check if the database already exists.
		  If dbFile.Exists Then
		    MessageBox("That combination of vault and password already exists.")
		    Return False
		  End If
		  
		  // Check if new username or password is empty.
		  If newUserName.Trim = "" Or newUserPassword.Trim = "" Then
		    MessageBox("New username or password cannot be empty.")
		    Return False
		  End If
		  
		  // Create a new SQLite database file.
		  Var mDB As New SQLiteDatabase
		  mDB.DatabaseFile = dbFile
		  
		  Try
		    mDB.CreateDatabase
		    If mDB.Connect Then
		      Try
		        // Create the necessary tables in the new database.
		        Var ps As SQLitePreparedStatement = mDB.Prepare("CREATE TABLE Notes (Title varchar, User varchar, Password varchar)") 
		        ps.ExecuteSQL
		        
		        Var ps2 As SQLitePreparedStatement = mDB.Prepare("CREATE TABLE Identifier (FileName Text)") 
		        ps2.ExecuteSQL
		        
		        // Insert the identifier. Needed for import/export compatibility.
		        Var ps3 As SQLitePreparedStatement = mDB.Prepare("INSERT INTO Identifier (FileName) VALUES (?)") 
		        ps3.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		        ps3.Bind(0, fileName)
		        ps3.ExecuteSQL
		        
		        // Migrate the notes from the old database to the new one.
		        For Each item As Note In Notes
		          item.Password = GetDetailsFromDB(item.Title) 
		          
		          Var ps4 As SQLitePreparedStatement = mDB.Prepare("INSERT INTO Notes (User, Title, Password) VALUES (?, ?, ?)") 
		          ps4.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		          ps4.BindType(1, SQLitePreparedStatement.SQLITE_TEXT)
		          ps4.BindType(2, SQLitePreparedStatement.SQLITE_TEXT)
		          
		          ps4.Bind(0, item.User)
		          ps4.Bind(1, item.Title)
		          ps4.Bind(2, item.Password)
		          
		          ps4.SQLExecute
		          
		        Next
		        
		        mDB.Encrypt("aes256:" + newUserPassword)
		        mDB.Close
		        
		        app.dbFile.Remove
		        
		        Return True
		        
		      Catch error As RuntimeException
		        MessageBox("Unexpected error: " + error.Message)
		        dbFile.Remove // Clean up the new database file in case of any failure.
		        Return False
		      End Try
		      
		    Else
		      System.DebugLog("Error creating SQLite database: " + mDB.ErrorMessage)
		      Return False
		    End If
		  Catch
		    System.DebugLog("Error creating SQLite database file.")
		    Return False
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanData()
		  // Cleans up all application data in memory, resetting the state for a fresh start.
		  // This does not affect data stored in the database files.
		  
		  //Close database if connected
		  If mDB <> Nil And mDB.IsConnected Then
		    mDB.Close
		  End If
		  
		  dbFile = Nil
		  mDB = Nil
		  Redim Notes(-1)
		  
		  userName = ""
		  userPassword = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloseDBAndEncrypt(userPassword As String) As Boolean
		  // Closes the database connection and encrypts it using the specified user password.
		  // Returns True if the operation succeeds, False otherwise.
		  
		  If mDB <> Nil Then
		    Try
		      mDB.Encrypt("aes256:" + userPassword)
		      
		      mDB.Close
		      mIsConnected = False
		      
		      Return True
		      
		    Catch error As RuntimeException
		      System.DebugLog("Failed to close and encrypt the database: " + error.Message)
		      Return False
		    End Try
		    
		  Else
		    System.DebugLog("No active database connection to close.")
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectToDBAndDecrypt(userName As String, userPassword As String) As Boolean
		  // Connects to the encrypted database and decrypts it using the provided username and password.
		  // Returns True if the connection is successful, False otherwise.
		  
		  Var fileName As String
		  Var hash As String
		  
		  // Generate a SHA256 hash based on the username and password to identify the database file.
		  hash = Crypto.Hash(userPassword + userName, Crypto.Algorithm.SHA256)
		  fileName = EncodeHex(hash) + ".db"
		  
		  dbFile = SpecialFolder.ApplicationData
		  dbFile = dbFile.Child("YJAPasswordManager")
		  dbFile = dbFile.Child(fileName)
		  
		  If dbFile = Nil Or Not dbFile.Exists Then
		    MessageBox("Vault not found or incorrect password.")
		    Return False
		  End If
		  
		  mDb = New SQLiteDatabase
		  mDb.DatabaseFile = dbFile
		  mDB.EncryptionKey = "aes256:" + userPassword
		  
		  Try
		    mDB.Decrypt
		    
		    If mDB.Connect Then
		      mIsConnected = True
		      
		      // Obfuscate and store the username and password.
		      Me.userName = App.StringObfuscator(userName, dbFile.Name)
		      Me.userPassword = App.StringObfuscator(userPassword, dbFile.Name)
		      
		      Return True
		      
		    Else
		      MessageBox("Error opening SQLite database: " + mDB.ErrorMessage)
		      Return False
		    End If
		    
		  Catch error As RuntimeException
		    MessageBox("Unexpected error during database connection: " + error.Message)
		    Return False
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateDBSchema() As Boolean
		  // Creates the database schema by setting up the required tables.
		  // Returns True if the schema is successfully created, False otherwise.
		  
		  Try
		    // Create the Notes table to store user data, titles, and passwords.
		    Var ps As SQLitePreparedStatement = mDB.Prepare("CREATE TABLE Notes (Title varchar, User varchar, Password varchar)") 
		    ps.ExecuteSQL
		    
		    // Create the Identifier table, needed for import/expot vault functionality
		    Var ps2 As SQLitePreparedStatement = mDB.Prepare("CREATE TABLE Identifier (FileName Text)") 
		    ps2.ExecuteSQL
		    
		    Return True
		    
		  Catch error As RuntimeException
		    // Handle unexpected runtime errors during schema creation.
		    MessageBox("Unexpected error while creating database schema: " + error.Message)
		    Return False
		  End Try
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateNewVault(userName As String, userPassword As String) As Boolean
		  // Creates a new database file with the given user name and password combination.
		  // Checks if a database with the same combination already exists.
		  // If it does not, creates the database, sets up the schema, and encrypts it.
		  // Returns True if successful, False otherwise.
		  
		  Var fileName As String
		  Var hash As String
		  
		  // Generate a unique hash for the database file name using the user name and password.
		  hash = Crypto.Hash(userPassword + userName, Crypto.Algorithm.SHA256)
		  fileName = EncodeHex(hash) + ".db"
		  
		  // Determine the full path for the database file.
		  dbFile = SpecialFolder.ApplicationData
		  dbFile = dbFile.Child("YJAPasswordManager")
		  dbFile = dbFile.Child(fileName)
		  
		  // Check if a database with this combination already exists.
		  If dbFile.Exists Then
		    MessageBox("This combination of user name and password already exists. Please try another one.")
		    Return False
		  Else
		    mDB = New SQLiteDatabase
		    mDB.DatabaseFile = dbFile
		    
		    Try
		      mDB.CreateDatabase
		      If mDB.Connect Then
		        If CreateDBSchema Then
		          Try
		            // Insert the identifier into the database needed for import/export functionality.
		            Var ps As SQLitePreparedStatement = mDB.Prepare("INSERT INTO Identifier (FileName) VALUES (?)")
		            ps.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		            ps.Bind(0, fileName)
		            ps.ExecuteSQL
		            
		            mDB.Encrypt("aes256:" + userPassword)
		            
		            Return True
		            
		          Catch error As RuntimeException
		            MessageBox("Unexpected error: " + error.Message)
		            Return False
		          End Try
		        End If
		        
		        // Schema creation failed.
		        MessageBox("Failed to create database schema.")
		        Return False
		      Else
		        // Database connection failed.
		        Return False
		      End If
		    Catch error As RuntimeException
		      MessageBox("Unexpected error: " + error.Message)
		      Return False
		    End Try
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteItemFromDB(ItemName As String)
		  // Deletes an item from the database by its title.
		  // Prompts the user for confirmation before proceeding.
		  // ItemName: The title of the note to be deleted.
		  
		  // Display a confirmation dialog to the user.
		  Var d As New MessageDialog                      
		  Var b As MessageDialogButton                    
		  d.IconType = MessageDialog.IconTypes.Caution    
		  d.ActionButton.Caption = "Delete"
		  d.CancelButton.Visible = True                   
		  d.Title = "Confirmation Required"
		  d.Message = "Are you sure?"
		  d.Explanation = "This operation cannot be undone."
		  
		  b = d.ShowModal
		  
		  If b = d.ActionButton Then
		    
		    If ConnectToDBAndDecrypt( _
		      App.StringObfuscator(userName, dbFile.Name), _
		      App.StringObfuscator(userPassword, dbFile.Name)) Then
		      
		      Try
		        Var ps As SQLitePreparedStatement = mDB.Prepare("DELETE FROM Notes WHERE Title = ?") 
		        ps.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		        ps.Bind(0, ItemName)
		        ps.ExecuteSQL
		        
		        // Reload the data to update the Notes array in memory, and close the database securely.
		        If Not LoadData Then
		          MessageBox("Error connecting to the database.")
		        End If
		        
		        If Not CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name)) Then
		          MessageBox("Failed to close and encrypt the database.")
		        End If
		        
		      Catch error As RuntimeException
		        MessageBox("Unexpected error while deleting item: " + error.Message)
		        Call CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name))
		        Return
		      End Try
		    End If
		    
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditItemAndUpdateDB(NewItem As  Note, OldItem As String)
		  // Edits an existing note in the database and updates its data.
		  // NewItem: The updated note details (User, Title, Password).
		  // OldItem: The title of the note to be updated.
		  
		  If ConnectToDBAndDecrypt( _
		    App.StringObfuscator(userName, dbFile.Name), _
		    App.StringObfuscator(userPassword, dbFile.Name)) Then
		    
		    Try
		      Var ps As SQLitePreparedStatement = mDB.Prepare("UPDATE Notes SET User = ?, Title = ?, Password = ? WHERE Title = ?") 
		      
		      ps.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		      ps.BindType(1, SQLitePreparedStatement.SQLITE_TEXT)
		      ps.BindType(2, SQLitePreparedStatement.SQLITE_TEXT)
		      ps.BindType(3, SQLitePreparedStatement.SQLITE_TEXT)
		      
		      ps.Bind(0, NewItem.User)
		      ps.Bind(1, NewItem.Title)
		      ps.Bind(2, NewItem.Password)
		      ps.Bind(3, OldItem)
		      
		      ps.ExecuteSQL
		      
		      // Reload the updated data into memory and close the database.
		      Call LoadData
		      Call CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name))
		      
		    Catch error As RuntimeException
		      MessageBox("An error occurred while editing the item: " + error.Message)
		      Call CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name))
		      Return
		    End Try
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateRandomPassword(length As Integer = 12, includeUppercase As Boolean = True, includeNumbers As Boolean = True, includeSpecialChars As Boolean = True) As String
		  
		  // Define the character sets.
		  Const LowercaseLetters As String = "abcdefghijklmnopqrstuvwxyz"
		  Const UppercaseLetters As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		  Const Numbers As String = "0123456789"
		  Const SpecialChars As String = "!@#$%^&*()-_=+[]{}|;:,.<>?/"
		  
		  // Build the character pool based on the options.
		  Var characterPool As String = LowercaseLetters
		  If includeUppercase Then characterPool = characterPool + UppercaseLetters
		  If includeNumbers Then characterPool = characterPool + Numbers
		  If includeSpecialChars Then characterPool = characterPool + SpecialChars
		  
		  // Ensure the character pool is not empty.
		  If characterPool = "" Then
		    Return ""
		  End If
		  
		  // Generate the password.
		  Var randomPassword As String = ""
		  For i As Integer = 1 To length
		    Var randomIndex As Integer = System.Random.InRange(0, characterPool.Length - 1)
		    randomPassword = randomPassword + characterPool.Mid(randomIndex + 1, 1)
		  Next
		  
		  Return randomPassword
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDetailsFromDB(Title As String, CommandLine As Boolean = False) As String
		  // Retrieves the password associated with the given title from the database.
		  // Title: The title of the note to search for.
		  // CommandLine: Indicates if the function is being executed from the command line. Defaults to False.
		  // Returns the password as a string if found, or an empty string if not.
		  
		  Var p As String = ""
		  Var uName As String
		  Var uPassword As String
		  
		  // Determine credentials based on the execution context.
		  If CommandLine Then
		    uName = App.userName
		    uPassword = App.userPassword
		  Else
		    uName = App.StringObfuscator(userName, dbFile.Name)
		    uPassword = App.StringObfuscator(userPassword, dbFile.Name)
		  End If
		  
		  If ConnectToDBAndDecrypt(uName, uPassword) Then
		    Try
		      Var ps As SQLitePreparedStatement = mDB.Prepare("SELECT Password FROM Notes WHERE Title = ?") 
		      ps.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		      
		      Var data As RowSet = ps.SelectSQL(Title)
		      
		      If data <> Nil Then
		        
		        While Not data.AfterLastRow
		          p = data.Column("Password").StringValue
		          data.MoveToNextRow
		        Wend
		        
		        data.Close
		      End If
		      
		      // Ensure the database is encrypted and closed after the operation.
		      Call CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name))
		      
		    Catch error As RuntimeException
		      MessageBox("An error occurred while processing the request: " + error.Message)
		      Call CloseDBAndEncrypt(App.StringObfuscator(userPassword, dbFile.Name))
		      Return p
		    End Try
		  End If
		  
		  // Return the password (or empty string if not found).
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsConnected() As Boolean
		  // Checks if the database connection is active and updates the connection status.
		  // Returns True if connected, False otherwise.
		  
		  // If the database object is Nil, the connection is considered inactive.
		  If mDB Is Nil Then
		    mIsConnected = False
		  Else
		    // Optionally:
		    // Add additional checks to verify the connection status if needed.
		  End If
		  
		  Return mIsConnected
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemAlreadyExists(ItemTitle As String) As Boolean
		  // Checks if a note with the specified title already exists in the Notes array.
		  // ItemTitle: The title of the note to search for.
		  // Returns True if a note with the same title exists, False otherwise.
		  
		  For i As Integer = 0 To Notes.UBound
		    If Notes(i).Title = ItemTitle Then
		      Return True 
		    End If
		  Next
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadData() As Boolean
		  // Loads data from the database and populates the Notes array with user and title information.
		  // Returns True if the data is successfully loaded, False otherwise.
		  
		  // Check if the database is connected before proceeding.
		  If Not IsConnected Then
		    Return False
		  End If
		  
		  Try
		    Var ps As SQLitePreparedStatement = mDB.Prepare("SELECT User, Title FROM Notes") 
		    
		    Var data As RowSet = ps.SelectSQL
		    
		    If data <> Nil Then
		      
		      // Clear the existing Notes array if it already contains data.
		      If Notes <> Nil Then
		        Redim Notes(-1) 
		      End If
		      
		      // Iterate through the result set to populate the Notes array.
		      While Not data.AfterLastRow
		        Var n As New Note
		        n.User = data.Column("User").StringValue 
		        n.Title = data.Column("Title").StringValue 
		        n.Password = "********" 
		        
		        Notes.Append(n) 
		        data.MoveToNextRow
		      Wend
		      
		      data.Close
		      Return True
		      
		    Else
		      System.DebugLog("Error: No data retrieved from the query.")
		      Return False
		    End If
		    
		  Catch error As RuntimeException
		    System.DebugLog("Unexpected Error: " + error.Message)
		    Return False
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringObfuscator(inputText As String, keyText As String) As String
		  //This method is used to obfuscate certain variables while they are stored in memory during program execution. 
		  //PENDING Implementing a more efficient approach
		  
		  // inputText: The data to be processed (encrypted or decrypted).
		  // keyText: The key used for the encryption/decryption process.
		  // Returns the processed (encrypted/decrypted) data as a string.
		  
		  // Convert input and key to MemoryBlocks for byte-level operations.
		  Var inputData As MemoryBlock = inputText
		  Var outputData As New MemoryBlock(inputData.Size) 
		  Var encryptionKey As MemoryBlock = keyText
		  
		  Var keySize As Integer = encryptionKey.Size 
		  Var permutationArray As New MemoryBlock(256) 
		  
		  // Initialize the permutation array with identity values (0-255).
		  For index As Integer = 0 To 255
		    permutationArray.Byte(index) = index
		  Next
		  
		  Var idx1, idx2 As Integer
		  For idx1 = 0 To 255
		    idx2 = (idx2 + permutationArray.Byte(idx1) + encryptionKey.Byte(idx1 Mod keySize)) Mod 256
		    
		    Var temp As Byte = permutationArray.Byte(idx2)
		    permutationArray.Byte(idx2) = permutationArray.Byte(idx1)
		    permutationArray.Byte(idx1) = temp
		  Next
		  
		  // Process the input data using the keystream generated from the permutation array.
		  idx1 = 0
		  idx2 = 0
		  For byteIndex As Integer = 0 To inputData.Size - 1
		    idx1 = (idx1 + 1) Mod 256
		    idx2 = (idx2 + permutationArray.Byte(idx1)) Mod 256
		    
		    // Swap the values at idx1 and idx2.
		    Var temp As Byte = permutationArray.Byte(idx2)
		    permutationArray.Byte(idx2) = permutationArray.Byte(idx1)
		    permutationArray.Byte(idx1) = temp
		    
		    // Generate a keystream byte and XOR it with the input byte.
		    Var keystream As Byte = permutationArray.Byte((permutationArray.Byte(idx1) + permutationArray.Byte(idx2)) Mod 256)
		    outputData.Byte(byteIndex) = inputData.Byte(byteIndex) XOR keystream
		  Next
		  
		  Return outputData
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		dbFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Left As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDB As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsConnected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Notes() As Note
	#tag EndProperty

	#tag Property, Flags = &h0
		Top As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		userName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		userPassword As String
	#tag EndProperty


	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="userName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="userPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
