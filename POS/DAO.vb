Imports MySql.Data.MySqlClient

Public Class DAO
    Private connectionStringValue As String
    Private connection As MySqlConnection
    Private readerValue As MySqlDataReader
    Private command As New MySqlCommand

    Public Sub New(ByVal ConnectionString As String)
        Me.ConnectionString = ConnectionString
        connection = New MySqlConnection(ConnectionString)
        command.Connection = connection
    End Sub

    Public Property ConnectionString() As String
        Get
            Return connectionStringValue
        End Get
        Set(value As String)
            connectionStringValue = value
        End Set
    End Property

    Public Property Reader() As MySqlDataReader
        Get
            Return readerValue
        End Get
        Set(value As MySqlDataReader)
            readerValue = value
        End Set
    End Property

    Public Function GetAllItems() As List(Of Item)
        Dim lstItems As New List(Of Item)
        connection.Open()
        command.CommandText = "SELECT * FROM cps298.item"
        Reader = command.ExecuteReader

        While Reader.Read
            lstItems.Add(New Item(Reader.GetInt32(0), Reader.GetString("name"), Reader.GetString("category"), Reader.GetDecimal(3)))
        End While

        For Each item As Item In lstItems
            Console.WriteLine(item.Name & item.Item_id & item.Price & item.Category)
        Next
        Return lstItems

        connection.Close()
    End Function

End Class
