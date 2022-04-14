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
        'returns a list of all items that are active and in stock

        Dim lstItems As New List(Of Item)
        connection.Open()
        command.CommandText = "SELECT * FROM dumpster_fire.menu_item;"
        Reader = command.ExecuteReader
        While Reader.Read
            If Reader.GetInt32(6) = 1 And Reader.GetInt32(4) > 0 Then
                lstItems.Add(New Item(Reader.GetInt32(0), Reader.GetString("item_name"), Reader.GetString("item_category"), Reader.GetDecimal(5)))
            End If
        End While
        Reader.Close()
        connection.Close()
        Return lstItems
    End Function

    Public Function GetAllIngredients() As List(Of Ingredient)
        'Returns a list of all ingredients that are in stock and active
        Dim lstIngredients As New List(Of Ingredient)
        connection.Open()
        command.CommandText = "SELECT * FROM dumpster_fire.ingredient ORDER BY ingredient_name;"
        Reader = command.ExecuteReader

        While Reader.Read
            If Reader.GetInt32(5) = 1 And Reader.GetInt32(3) > 0 Then
                lstIngredients.Add(New Ingredient(Reader.GetInt32(0), Reader.GetString("ingredient_name"), Reader.GetString("ingredient_category"), Reader.GetInt32(3), Reader.GetDecimal(4), Reader.GetInt32(5)))
            End If
        End While

        Reader.Close()
        connection.Close()
        Return lstIngredients
    End Function

    Public Function GetItemCategories() As List(Of String)
        Dim lstCategories As New List(Of String)
        connection.Open()
        command.CommandText = "SELECT DISTINCT item_category FROM dumpster_fire.menu_item;"
        Reader = command.ExecuteReader

        While Reader.Read
            lstCategories.Add(Reader.GetString("item_category"))
        End While

        Reader.Close()
        connection.Close()
        Return lstCategories
    End Function

    Public Function GetIngredientCategories() As List(Of String)
        Dim lstCategories As New List(Of String)
        connection.Open()
        command.CommandText = "SELECT DISTINCT `ingredient_category` FROM dumpster_fire.ingredient;"
        Reader = command.ExecuteReader

        While Reader.Read
            lstCategories.Add(Reader.GetString("ingredient_category"))
        End While

        Reader.Close()
        connection.Close()
        Return lstCategories
    End Function

    Public Function GetHighestOrderId() As Integer
        'Returns the ID of the most recently created order
        'To only be use directly after calling dao.CreateOrder
        Dim orderID As Integer
        connection.Open()
        command.CommandText = "Select MAX(order_id) FROM dumpster_fire.order_info"
        Reader = command.ExecuteReader()
        If Reader.Read Then
            orderID = Reader.GetInt32(0)
        End If
        connection.Close()
        Return orderID
    End Function

    Public Function GetAllOpenOnlineOrders() As List(Of Order)
        'Returns all open online orders
        Dim lstOpenOnlineOrders As New List(Of Order)
        connection.Open()
        command.CommandText = "Select MAX(order_id) FROM dumpster_fire.order_info"
        Reader = command.ExecuteReader()
        If Reader.Read Then
            lstOpenOnlineOrders.Add('reader columns)
        End If
        connection.Close()
        Return lstOpenOnlineOrders
    End Function

    Public Function GetDefaultIngredientIds(item As Item) As List(Of Integer)
        'returns a list of the default ingredient's IDs for an item that are in stock and active

        Dim lstItemId As New List(Of Integer)
        connection.Open()
        command.CommandText =
            "select midi.ingredient_id
            from dumpster_fire.menu_item_default_ingredient midi 
            inner join dumpster_fire.ingredient i on midi.ingredient_id = i.ingredient_id 
            where midi.menu_item_id = '" & item.Item_id & "' AND i.is_active = 1 AND i.ingredient_stock > 0
            order by midi.menu_item_id"
        Reader = command.ExecuteReader
        While Reader.Read
            lstItemId.Add(Reader.GetInt32(0))
        End While
        Reader.Close()
        connection.Close()
        Return lstItemId

    End Function

    Public Function CreateOrder(order As Order, user_id As Integer)
        'Inserts order with no item related info as a place holder
        connection.Open()
        command.CommandText = "INSERT INTO `dumpster_fire`.`order_info` (`user_id`, `order_date`, `order_type`, `table_number`, `is_open`) VALUES ('" & user_id & "', '" & DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") & "', 'dine_in', '" & order.Location & "', '" & 1 & "');"
        command.ExecuteNonQuery()
        connection.Close()
    End Function

    Public Sub SendItems(order As Order, user_id As Integer)
        For Each item As Item In order.LstItems
            If item.Sent = False Then
                If item.Modifications.Count = 0 Then
                    connection.Open()
                    command.CommandText = "INSERT INTO `dumpster_fire`.`item_ordered` (`order_id`, `item_number`, `menu_item`) VALUES ('" & order.OrderId & "', '" & order.LstItems.IndexOf(item) + 1 & "', '" & item.Item_id & "')"
                    command.ExecuteNonQuery()
                    connection.Close()
                Else
                    For Each modification As Ingredient In item.Modifications
                        connection.Open()
                        command.CommandText = "INSERT INTO `dumpster_fire`.`item_ordered` (`order_id`, `item_number`, `menu_item`, `ingredient_id`, `modification`) VALUES ('" & order.OrderId & "', '" & order.LstItems.IndexOf(item) + 1 & "', '" & item.Item_id & "', '" & modification.Id & "', '" & modification.Modification & "')"
                        command.ExecuteNonQuery()
                        connection.Close()
                    Next
                End If
            End If
        Next

    End Sub

    Public Function Login(pin As Integer) As User
        Dim user As User

        connection.Open()
        command.CommandText = "SELECT * FROM dumpster_fire.user WHERE user_id=" & pin & ";"
        Reader = command.ExecuteReader

        If Reader.Read Then
            user = New User(pin, Reader.GetString("first_name"), Reader.GetString("last_name"))
        End If

        Reader.Close()
        connection.Close()
        Return user
    End Function


End Class
