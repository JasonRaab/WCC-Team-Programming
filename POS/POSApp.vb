Imports System.Drawing
''' <summary>
''' To Do Front End:
''' Display totals in a nicer way. Probably a dataTemplate like in ticket
''' Make it so that sent items are highlighted and can no longer be deleted
''' 
''' To Do Backend
''' Send orders to database
''' Change the itemSource of lstBoxTicket from lstBoxTicket.Items to selectedOrder.Items
'''     This will require adjustments in a lot of functions
''' Create PIN pad on login page
'''     Bring user_id that is entered to where ever it is needed. Just in POSApp?
''' Clean up OrderPage.XAML there are bits of old attempts to make sent items turn blue
''' Make modifyer popup page when an item is selected
''' 
''' Extra Functionality - Make it store menu in XML so that it can run without db connection.
''' </summary>
Public Class POSApp


    Private selectedItem As Item
    Private dctItemItemNumber As New Dictionary(Of Item, Integer)
    Private dctIngredientButtons As New Dictionary(Of Button, Ingredient)
    Private itemNumber As Integer
    'Private modifiersPopup As ModifiersPopup
    Private loginPageValue As LoginPage
    Private mainWindowValue As MainWindow
    Private orderSelectionpageValue As OrderSelectionPage
    Private dao As DAO
    Private lstAllItemsValue As New List(Of Item)
    Private dctItemButtonsValue As New Dictionary(Of Button, Item)
    Private orderPage As OrderPage
    Private lstAllIngredients As New List(Of Ingredient)
    Private lstRelevantIngredients As New List(Of Ingredient)
    Private lstOpenOrders As New List(Of Order)
    Private lstClosedOrders As New List(Of Order)
    Private selectedOrder As New Order
    Private userValue As User
    Private modifiersPopupValue As ModifiersPopup

    Public Property User() As User
        Get
            Return userValue
        End Get
        Set(value As User)
            userValue = value
        End Set
    End Property
    Public Property LoginPage() As LoginPage
        Get
            Return loginPageValue
        End Get
        Set(value As LoginPage)
            loginPageValue = value
        End Set
    End Property
    Public Property DctItemButtons() As Dictionary(Of Button, Item)
        Get
            Return dctItemButtonsValue
        End Get
        Set(value As Dictionary(Of Button, Item))
            dctItemButtonsValue = value
        End Set
    End Property
    Public Property LstAllItems() As List(Of Item)
        Get
            Return lstAllItemsValue
        End Get
        Set(value As List(Of Item))
            lstAllItemsValue = value
        End Set
    End Property
    Public Property MainWindow() As MainWindow
        Get
            Return mainWindowValue
        End Get
        Set(value As MainWindow)
            mainWindowValue = value
        End Set
    End Property
    Public Property OrderSelectionPage() As OrderSelectionPage
        Get
            Return orderSelectionpageValue
        End Get
        Set(value As OrderSelectionPage)
            orderSelectionpageValue = value
        End Set
    End Property
    Public Property ModifiersPopup() As ModifiersPopup
        Get
            Return modifiersPopupValue
        End Get
        Set(value As ModifiersPopup)
            modifiersPopupValue = value
        End Set
    End Property

    Public Sub New(MainWindow As MainWindow)
        'Create all pages and dao. Populate various things for order page. Show login page.
        Me.MainWindow = MainWindow
        LoginPage = New LoginPage(Me)
        OrderSelectionPage = New OrderSelectionPage(Me)
        orderPage = New OrderPage(Me)
        ModifiersPopup = New ModifiersPopup(Me)
        dao = New DAO("datasource=167.172.242.79;port=3306;username=testUser;password=test@password298")
        PopulateItemCategoryButtons()
        PopulateItemButtons()
        PopulateLstBoxTotals()
        MainWindow.Content = LoginPage
    End Sub


    '''''''''' Populating Functions ''''''''''

    Public Sub PopulateIngredientButtons()
        Dim lstIngredientCategories As New List(Of String)
        Dim intRow As Integer
        Dim intColumn As Integer
        lstAllIngredients = dao.GetAllIngredients()

        'Create a button for each ingredient and add it to the dctIngredientButtons Dictonary
        For Each ingredient As Ingredient In lstAllIngredients
            Dim btn As New Button
            btn.Content = ingredient.Name.Replace(" ", Environment.NewLine)
            btn.HorizontalContentAlignment = HorizontalAlignment.Center
            btn.Name = "btn" & ingredient.Name.Replace(" ", "")
            btn.Height = 70
            btn.Width = 70
            btn.FontSize = 14
            AddHandler btn.Click, AddressOf IngredientBtn_Click
            dctIngredientButtons.Add(btn, ingredient)
        Next
    End Sub

    Public Sub PopulateItemCategoryButtons()
        Dim intRow As Integer
        Dim lstCateGories As List(Of String)
        intRow = 0
        lstCateGories = dao.GetItemCategories()

        For Each category As String In lstCateGories
            Dim btn As New Button
            btn.Content = category
            btn.Name = "btn" & category.Replace(" ", "")
            btn.Height = 125
            btn.Width = 125
            btn.FontSize = 18
            AddHandler btn.Click, AddressOf CategoryBtn_Click
            Grid.SetRow(btn, intRow)
            orderPage.categoryGridPanel.Children.Add(btn)
            intRow += 1
        Next

    End Sub

    Public Sub PopulateItemButtons()
        'Makes a button for each menu item
        'Adds the button and its item to DctItemButtons

        LstAllItems = dao.GetAllItems()
        For Each item As Item In LstAllItems
            Try
                Dim btn As New Button
                btn.Content = item.Name.Replace(" ", Environment.NewLine)
                btn.HorizontalContentAlignment = HorizontalAlignment.Center
                btn.Name = "btn" & item.Name.Replace(" ", "")
                btn.Height = 125
                btn.Width = 125
                btn.FontSize = 18
                AddHandler btn.Click, AddressOf StartItem
                DctItemButtons.Add(btn, item)
            Catch ex As Exception

            End Try

        Next


    End Sub

    Public Sub PopulateLstBoxTotals()
        orderPage.lstBoxTotals.Items.Add("SubTotal:")
        orderPage.lstBoxTotals.Items.Add("Tax:")
        orderPage.lstBoxTotals.Items.Add("Total:")
    End Sub

    Public Sub DisplayOpenOrder(order As Order)
        For Each item As Item In order.LstItems
            orderPage.lstBoxTicket.Items.Add(item)
        Next
    End Sub

    '''''''''' Updating Functions ''''''''''
    Public Sub UpdateCategory(categoryName As String)
        Dim intRow As Integer
        Dim intColumn As Integer
        intRow = 0
        intColumn = 0

        'Remove all item buttons, change category header
        orderPage.itemGridPanel.Children.Clear()
        orderPage.lblCategoryHeader.Content = categoryName & "s"

        'If an item's category matches the string passed in then display its button
        For Each pair As KeyValuePair(Of Button, Item) In dctItemButtonsValue
            If pair.Value.Category.Equals(categoryName) Then
                Grid.SetColumn(pair.Key, intColumn)
                Grid.SetRow(pair.Key, intRow)
                'MainWindow.itemGridPanel.Children.Add(pair.Key)
                orderPage.itemGridPanel.Children.Add(pair.Key)
                intColumn += 1
                If intColumn > 3 Then
                    intColumn = 0
                    intRow += 1
                End If
            End If
        Next
    End Sub

    Private Sub UpdateTotals()
        Dim subTotal As Decimal
        Dim tax As Decimal
        Dim total As Decimal
        subTotal = 0.00

        For Each item As Item In orderPage.lstBoxTicket.Items
            subTotal = subTotal + item.Price
        Next

        tax = subTotal * 0.06
        total = subTotal + tax
        orderPage.lstBoxTotals.Items.Clear()
        orderPage.lstBoxTotals.Items.Add("SubTotal:                                 " & Math.Round(subTotal, 2).ToString)
        orderPage.lstBoxTotals.Items.Add("Tax:                                        " & Math.Round(tax, 2).ToString)
        orderPage.lstBoxTotals.Items.Add("Total:                                  " & Math.Round(total, 2).ToString)
        selectedOrder.SubTotal = subTotal
        selectedOrder.Tax = tax
        selectedOrder.Total = total
    End Sub

    Private Sub UpdateLables(item As Item)
        If TypeOf item Is Item Then
            orderPage.lblId.Content = item.Item_id
            orderPage.lblName.Content = item.Name
            orderPage.lblCategory.Content = item.Category
            orderPage.lblPrice.Content = item.Price
        End If
    End Sub

    '''''''''' Navigation Functions ''''''''''
    Public Sub ExitOrderPage()
        MainWindow.Content = OrderSelectionPage
    End Sub

    Public Sub ExitOrderSelectionPage()
        MainWindow.Content = LoginPage
    End Sub

    Public Sub LoginPageGo(pin As String)
        'Takes in pin from login page
        'Calls DAO method to get user based on pin which is user_id

        If pin.Equals("") Then
            InvalidPin()
        Else
            If dao.Login(CType(pin, Integer)) IsNot Nothing Then
                MainWindow.Content = OrderSelectionPage
                User = New User(dao.Login(CType(pin, Integer)))
                OrderSelectionPage.lblUserName.Content = User.FirstName & " " & User.LastName
            Else
                InvalidPin()
            End If
        End If

    End Sub

    Public Sub ViewOrderPage(location As String)
        Dim orderFound As Boolean = False
        orderPage.lstBoxTicket.Items.Clear()
        orderPage.lblEmployeeName.Content = User.FirstName & " " & User.LastName
        'If there is already an open order at that location then load that order
        For Each order As Order In lstOpenOrders
            If order.Location.Equals(location) Then
                selectedOrder = order
                DisplayOpenOrder(order)
                orderFound = True
                Debug.WriteLine("Order found location " & location)
                Exit For
            End If
        Next

        'If there is not an open order at that location then make one
        If orderFound = False Then
            Dim order As New Order(location)
            lstOpenOrders.Add(order)
            selectedOrder = order
            Debug.WriteLine("No order found. New one created")
        End If

        'Either way, clean up and display the order page
        UpdateCategory("Entree")
        ClearLables()
        UpdateTotals()
        MainWindow.Content = orderPage
    End Sub

    ''''''''''' Other Functions '''''''''''''

    Public Sub IngredientBtn_Click(sender As Object, e As RoutedEventArgs)
        If dctIngredientButtons.ContainsKey(CType(sender, Button)) Then
            selectedItem.Modifications.Add(dctIngredientButtons.Item(CType(sender, Button)))
        End If
    End Sub

    Public Sub CategoryBtn_Click(sender As Object, e As RoutedEventArgs)
        UpdateCategory(CType(sender, Button).Content)
    End Sub

    Public Sub AddItem(selectedItem As Item)
        'dctItemItemNumber.Clear()
        'itemNumber = 0

        selectedOrder.LstItems.Add(selectedItem)
        orderPage.lstBoxTicket.Items.Add(selectedItem)
        orderPage.lstBoxTicket.SelectedItem = selectedItem
        UpdateTotals()

        For Each item As Object In orderPage.lstBoxTicket.Items
            If TypeOf item Is Item Then
                itemNumber += 1
                dctItemItemNumber.Add(item, itemNumber)
            End If
        Next

        For Each item As Item In selectedOrder.LstItems
            Debug.WriteLine("ITEM NAME: " & item.Name)
            For Each ingredient As Ingredient In item.Modifications
                Debug.WriteLine(item.Name & " INGREDIENT: " & ingredient.Name)
            Next
        Next
    End Sub

    Public Sub StartItem(clickedBtn As Object, e As RoutedEventArgs)

        'Uses DctItemButtons to find and create the correct item to use based on which button was clicked
        If DctItemButtons.ContainsKey(clickedBtn) Then
            selectedItem = New Item(DctItemButtons.Item(clickedBtn))
            ModifiersPopup.SelectedItem = selectedItem
            PopulateIngredientButtons()
            FilterIngredientCategory("Vegetable")
            ModifiersPopup.ShowDialog()
        End If
    End Sub

    Public Sub FilterIngredientCategory(category As String)
        ModifiersPopup.ingredientGridPanel.Children.Clear()
        Dim intColumn As Integer = 0
        Dim intRow As Integer = 0

        For Each pair As KeyValuePair(Of Button, Ingredient) In dctIngredientButtons
            'Break down name of ingredient category to the first word only
            'If pair.Value.Category.Contains(" ") Then
            '    ingredientCategory = pair.Value.Category.Substring(0, category.IndexOf(" "))
            'Else
            '    ingredientCategory = pair.Value.Category
            'End If
            If pair.Value.Category.Equals(category) Then
                Grid.SetRow(pair.Key, intRow)
                Grid.SetColumn(pair.Key, intColumn)
                ModifiersPopup.ingredientGridPanel.Children.Add(pair.Key)
                intColumn += 1
                If intColumn >= 4 Then
                    intRow += 1
                    intColumn = 0
                End If
            End If
        Next

    End Sub

    Public Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs)
        'Rename this method
        'Runs when the list box's selection changes IF something is selected

        If TypeOf orderPage.lstBoxTicket.SelectedItem Is Item Then
            UpdateLables(orderPage.lstBoxTicket.SelectedItem)
        End If
    End Sub

    Public Sub ClearTicket()
        Dim result As MessageBoxResult
        result = MessageBox.Show("Delete All Items?", "Are You Sure?", MessageBoxButton.YesNo)

        If result = MessageBoxResult.Yes Then
            orderPage.lstBoxTicket.Items.Clear()
            selectedOrder.LstItems.Clear()
            ClearLables()
            UpdateTotals()
        End If
    End Sub

    Private Sub ClearLables()
        orderPage.lblId.Content = "-"
        orderPage.lblName.Content = "-"
        orderPage.lblCategory.Content = "-"
        orderPage.lblPrice.Content = "-"
    End Sub

    Public Sub DeleteItem()
        selectedOrder.LstItems.Remove(orderPage.lstBoxTicket.SelectedItem)
        orderPage.lstBoxTicket.Items.Remove(orderPage.lstBoxTicket.SelectedItem)
        ClearLables()
        UpdateTotals()
    End Sub

    Public Sub SendOrder()
        dao.SendOrder(selectedOrder, User.UserID)
        'dao.SendTestOrder(selectedOrder)

        For Each item As Item In selectedOrder.LstItems
            If item.Sent = False Then
                item.Sent = True
            End If
        Next
        Debug.WriteLine(CType(orderPage.lstBoxTicket.SelectedItem, Item).Name)
        Debug.WriteLine(CType(orderPage.lstBoxTicket.SelectedItem, Item).Sent)
    End Sub

    Public Sub TakePayment()
        'Move selectedOrder from lstOpenOrders to lstClosedOrders

    End Sub

    'Public Sub PrintItemListTest()
    '    For Each item As Item In selectedOrder.LstItems2
    '        Debug.WriteLine(item.Name)
    '    Next
    '    Debug.WriteLine("-------------")
    'End Sub

    Private Sub InvalidPin()
        LoginPage.lblPin.Content = "Invalid Pin"
        LoginPage.InvalidLoginAttempt = True
    End Sub

    Private Function FilterIngredientList(category As String) As List(Of Ingredient)
        Dim lstIngredients As New List(Of Ingredient)
        For Each ingredient As Ingredient In lstAllIngredients
            If ingredient.Category.Equals(category) Then
                lstIngredients.Add(ingredient)
            End If
        Next
        Return lstIngredients
    End Function

End Class
