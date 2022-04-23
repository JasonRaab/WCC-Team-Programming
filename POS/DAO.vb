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

        Dim lstAllItems As New List(Of Item)
        Dim lstAllIngredients As New List(Of Ingredient)
        Dim lstOpenOnlineOrders As New List(Of Order)
        Dim order_id As Integer
        Dim user_id As Integer
        Dim order_date As String
        Dim order_subtotal As Decimal
        Dim order_tax As Decimal
        Dim order_total As Decimal
        Dim order_type As String
        Dim table_number As String
        Dim is_open As Integer
        Dim item_number As Integer
        Dim menu_item As Integer
        Dim ingredient_id As Integer
        Dim modification As Integer
        Dim previous_order_id As Integer = Nothing
        Dim previous_item_number As Integer = Nothing
        lstAllItems = GetAllItems()
        lstAllIngredients = GetAllIngredients()

        'First, get a list of all online orders that are not closed
        connection.Open()
        command.CommandText = "SELECT * FROM dumpster_fire.order_info WHERE order_type = 'pickup' AND is_open = 1"
        Reader = command.ExecuteReader()

        While Reader.Read
            If Reader.IsDBNull(0) Then
                order_id = Nothing
            Else
                order_id = Reader.GetInt32(0)
            End If
            If Reader.IsDBNull(1) Then
                user_id = Nothing
            Else
                user_id = Reader.GetInt32(1)
            End If
            If Reader.IsDBNull(2) Then
                order_date = Nothing
            Else
                order_date = Reader.GetString("order_date")
            End If
            If Reader.IsDBNull(3) Then
                order_subtotal = Nothing
            Else
                order_subtotal = Reader.GetInt32(3)
            End If
            If Reader.IsDBNull(4) Then
                order_tax = Nothing
            Else
                order_tax = Reader.GetInt32(4)
            End If
            If Reader.IsDBNull(5) Then
                order_total = Nothing
            Else
                order_total = Reader.GetInt32(5)
            End If
            If Reader.IsDBNull(6) Then
                order_type = Nothing
            Else
                order_type = Reader.GetString("order_type")
            End If
            If Reader.IsDBNull(7) Then
                table_number = Nothing
            Else
                table_number = Reader.GetString("table_number")
            End If
            If Reader.IsDBNull(8) Then
                is_open = Nothing
            Else
                is_open = Reader.GetInt32(8)
            End If
            lstOpenOnlineOrders.Add(New Order(order_id, user_id, order_date, order_subtotal, order_tax, order_total, order_type, table_number, is_open))
        End While
        connection.Close()

        'Second, run this query for each order from the query above to get the list of items for each order
        For Each order As Order In lstOpenOnlineOrders
            connection.Open()
            command.CommandText = "SELECT * FROM dumpster_fire.item_ordered WHERE order_id=" & order.OrderId
            Reader = command.ExecuteReader()
            While Reader.Read()
                Dim itemToAdd As Item
                Dim ingredientToAdd As Ingredient
                'assign each item to the correct order
                'First, check if the order_id from the item matches the order_id from the order
                'Then, look up the item in the lstAllItems by the menu_item value and add a copy to the order's item list
                If Reader.IsDBNull(0) Then
                    order_id = Nothing
                Else
                    order_id = Reader.GetInt32(0)
                End If
                If Reader.IsDBNull(1) Then
                    item_number = Nothing
                Else
                    item_number = Reader.GetInt32(1)
                End If
                If Reader.IsDBNull(2) Then
                    menu_item = Nothing
                Else
                    menu_item = Reader.GetInt32(2)
                End If
                If Reader.IsDBNull(3) Then
                    ingredient_id = Nothing
                Else
                    ingredient_id = Reader.GetInt32(3)
                End If
                If Reader.IsDBNull(4) Then
                    modification = Nothing
                Else
                    modification = Reader.GetInt32(4)
                End If

                If order_id = order.OrderId Then
                    For Each item As Item In lstAllItems
                        If menu_item = item.Item_id Then
                            'Get each modification and add it to the itemToAdd.Modifications
                            'Check if each row is refereing to the same item as the last row by comparing order_id and item_id
                            If item_number <> previous_item_number Then    'If this row is for an item different from the last, add a new item
                                itemToAdd = New Item(item)
                                order.LstItems.Add(itemToAdd)
                            End If
                            If ingredient_id <> Nothing Then    'If there is an ingredient in the row, make a copy of that ingreident and add it to the item's list of modifications
                                For Each ingredient As Ingredient In lstAllIngredients
                                    If ingredient_id = ingredient.Id Then
                                        ingredientToAdd = New Ingredient(ingredient)
                                        ingredientToAdd.Modification = modification
                                    End If
                                Next
                                itemToAdd.Modifications.Add(ingredientToAdd)
                            End If
                            previous_item_number = item_number
                        End If
                    Next
                End If
            End While
            connection.Close()
            previous_item_number = Nothing
        Next

        'This block is only debug text
        For Each order As Order In lstOpenOnlineOrders
            Debug.WriteLine("ORDER ID: " & order.OrderId)
            For Each item As Item In order.LstItems
                Debug.WriteLine(order.OrderId & " " & item.Name)
                For Each ingredient As Ingredient In item.Modifications
                    Debug.WriteLine("  " & ingredient.Name & " " & ingredient.Modification)
                Next
            Next
        Next
        Return lstOpenOnlineOrders
    End Function

    Public Function GetDefaultIngredientIds(item As Item) As List(Of Integer)
        'returns a list of the default ingredient's IDs for an item that are in stock and active

        Dim lstItemId As New List(Of Integer)
        connection.Open()
        command.CommandText =
            "Select midi.ingredient_id
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
        connection.Open()
        command.CommandText = "UPDATE `dumpster_fire`.`order_info` Set `order_subtotal` = '" & order.SubTotal & "', `order_tax` = '" & order.Tax & "', `order_total` = '" & order.Total & "' WHERE (`order_id` = '" & order.OrderId & "');"
        command.ExecuteNonQuery()
        connection.Close()
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

    Public Sub CloseOrder(order As Order)
        connection.Open()
        command.CommandText = "UPDATE `dumpster_fire`.`order_info` SET `is_open` = '0' WHERE (`order_id` = '" & order.OrderId & "');"
        command.ExecuteNonQuery()
        connection.Close()
    End Sub

End Class
