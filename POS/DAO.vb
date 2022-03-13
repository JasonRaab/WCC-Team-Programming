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
        command.CommandText = "SELECT * FROM dumpster_fire.menu_item;"
        Reader = command.ExecuteReader

        While Reader.Read
            lstItems.Add(New Item(Reader.GetInt32(0), Reader.GetString("item_name"), Reader.GetString("item_category"), Reader.GetDecimal(5)))
        End While

        Reader.Close()
        connection.Close()
        Return lstItems
    End Function

    Public Function GetAllIngredients() As List(Of Ingredient)
        'return all ingredients
        Dim lstIngredients As New List(Of Ingredient)
        connection.Open()
        command.CommandText = "SELECT * FROM dumpster_fire.ingredient ORDER BY ingredient_name;"
        Reader = command.ExecuteReader

        While Reader.Read
            lstIngredients.Add(New Ingredient(Reader.GetInt32(0), Reader.GetString("ingredient_name"), Reader.GetString("ingredient_category"), Reader.GetInt32(3), Reader.GetDecimal(4), Reader.GetInt32(5)))
        End While

        Reader.Close()
        connection.Close()
        Return lstIngredients
    End Function

    Public Function GetCategories() As List(Of String)
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

    Public Sub SendTestOrder(order As Order)
        'Order goes into order_info table
        connection.Open()
        command.CommandText = "INSERT INTO `dumpster_fire`.`order_info` (`order_type`, `order_price`) VALUES ('test', '" & order.Total.ToString & "');"
        command.ExecuteNonQuery()
        connection.Close()

        'Get the Primary key from new order_info table, it is used in the next inserts
        Dim orderID As Integer
        connection.Open()
        command.CommandText = "Select order_id FROM dumpster_fire.order_info ORDER BY order_id DESC LIMIT 1;"
        Reader = command.ExecuteReader
        If Reader.Read Then
            orderID = Reader.GetInt32(0)
        End If
        connection.Close()

        'Insert into item_ordered for each item in the order
        'For Each item As Item In order.LstItems
        '    connection.Open()
        '    command.CommandText = "INSERT INTO `dumpster_fire`.`item_ordered` (`order_id`, `menu_item_options_id`) VALUES ('" & orderID & "', '" & item.Item_id & "');"
        '    command.ExecuteNonQuery()
        '    connection.Close()
        'Next
    End Sub

    Public Sub SendOrder(order As Order, user_id As Integer)
        Debug.WriteLine("DAO SendOrder called")
        connection.Open()
        command.CommandText = "INSERT INTO `dumpster_fire`.`order_info` (`user_id`, `order_date`, `order_subtotal`, `order_tax`, `order_total`, `order_type`, `table_number`) VALUES ('" & user_id & "', '" & DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") & "', '" & order.SubTotal & "', '" & order.Tax & "', '" & order.Total & "', 'dine_in', '" & order.Location & "');"
        command.ExecuteNonQuery()
        connection.Close()

        Dim orderID As Integer
        connection.Open()
        command.CommandText = "Select MAX(order_id) FROM dumpster_fire.order_info"
        Reader = command.ExecuteReader()
        If Reader.Read Then
            orderID = Reader.GetInt32(0)
        End If
        connection.Close()

        'For Each item As Item In order.LstItems
        '    connection.Open()
        '    command.CommandText = "INSERT INTO `dumpster_fire`.item_ordered` (`order_id, item_number, menu_item, ingredient_id, modification) VALUES ('" & orderID & "', '" & item.Item_id & "', '" & item.Item_id & "', '" & item.Item_id & "', '" & item.Item_id & "')"
        '    command.ExecuteNonQuery()
        '    connection.Close()
        'Next
    End Sub

    Public Function Login(pin As Integer) As User
        Dim user As User

        connection.Open()
        command.CommandText = "SELECT * FROM dumpster_fire.user WHERE user_id=" & pin & ";"
        Reader = command.ExecuteReader

        If Reader.Read Then
            user = New User(pin, Reader.GetString("first_name"), Reader.GetString("last_name"))
            Debug.WriteLine("Pin was for " & user.FirstName)
        End If

        Reader.Close()
        connection.Close()
        Return user
    End Function
End Class
