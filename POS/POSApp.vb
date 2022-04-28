Imports System.Windows.Media.Brushes
Public Class POSApp

    Private dctOpenOnlineOrdersButtons As New Dictionary(Of Button, Order)
    Private dctIngredientButtons As New Dictionary(Of Button, Ingredient)
    Private loginPageValue As LoginPage
    Private mainWindowValue As MainWindow
    Private orderSelectionpageValue As OrderSelectionPage
    Private dao As DAO
    Private lstAllItemsValue As New List(Of Item)
    Private dctItemButtonsValue As New Dictionary(Of Button, Item)
    Private orderPage As OrderPage
    Private lstAllIngredients As New List(Of Ingredient)
    Private lstOpenLocalOrders As New List(Of Order)
    Private selectedOrder As New Order
    Private userValue As User
    Private modifiersPopupValue As ModifiersPopup
    Private addIngredientMode As Boolean = True
    Private lstAllOpenOnlineOrders As New List(Of Order)
    Private lstTableNumbers As New List(Of String)
    Private lstTableButtons As New List(Of Button)
    Private lstButtonColors As New List(Of Brush)
    Private takePaymentPopup As TakePaymentPopup

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
        takePaymentPopup = New TakePaymentPopup(Me)
        dao = New DAO("datasource=167.172.242.79;port=3306;username=pos;password=PASSword@cps298")
        PopulateCategoryColors()
        PopulateItemCategoryButtons()
        PopulateItemButtons()
        PopulateLstBoxTotals()
        PopulateTableButtons()
        MainWindow.Content = LoginPage
    End Sub


    '''''''''' Populating Functions ''''''''''

    Public Sub PopulateCategoryColors()
        lstButtonColors.Add(Brushes.SteelBlue)
        lstButtonColors.Add(Brushes.DarkSalmon)
        lstButtonColors.Add(Brushes.LightYellow)
        lstButtonColors.Add(Brushes.Teal)
        lstButtonColors.Add(Brushes.Purple)
        lstButtonColors.Add(Brushes.LightBlue)
        lstButtonColors.Add(Brushes.Pink)
        lstButtonColors.Add(Brushes.Cyan)
        lstButtonColors.Add(Brushes.Green)
    End Sub

    Public Sub PopulateIngredientButtons()
        dctIngredientButtons.Clear()
        Dim lstDefaultIngredientIds As New List(Of Integer)
        Dim lstIngredientCategories As New List(Of String)
        Dim intRow As Integer
        Dim intColumn As Integer
        lstAllIngredients = dao.GetAllIngredients()
        lstDefaultIngredientIds = dao.GetDefaultIngredientIds(ModifiersPopup.SelectedItem)

        'Create a button for each ingredient and add it to the dctIngredientButtons Dictonary
        'If the ingredient is inlcuded on the item by default, make it green. Else, make it red.
        For Each ingredient As Ingredient In lstAllIngredients
            Dim btn As New Button
            btn.Content = ingredient.Name.Replace(" ", Environment.NewLine)
            btn.HorizontalContentAlignment = HorizontalAlignment.Center
            'btn.VerticalAlignment = VerticalAlignment.Bottom
            btn.Name = "btn" & ingredient.Name.Replace(" ", "")
            btn.Height = 100
            btn.Width = 100
            btn.FontSize = 14
            btn.Style = CType(Application.Current.FindResource("RoundedButtonStyle"), Style)
            If lstDefaultIngredientIds.Contains(ingredient.Id) Then
                btn.Background = Brushes.Green
            Else
                btn.Background = Brushes.Red
            End If
            AddHandler btn.Click, AddressOf IngredientBtn_Click
            dctIngredientButtons.Add(btn, ingredient)
        Next
    End Sub

    Public Sub PopulateItemCategoryButtons()
        Dim intRow As Integer = 0
        Dim intColumn As Integer = 0
        Dim colorIndex As Integer = 0
        Dim lstCateGories As List(Of String)
        lstCateGories = dao.GetItemCategories()

        For Each category As String In lstCateGories
            Dim btn As New Button
            btn.Content = category
            btn.Name = "btn" & category.Replace(" ", "")
            btn.Height = 100
            btn.Width = 100
            btn.FontSize = 14
            btn.Style = CType(Application.Current.FindResource("RoundedButtonStyle"), Style)
            btn.Background = lstButtonColors(colorIndex)
            colorIndex += 1
            AddHandler btn.Click, AddressOf CategoryBtn_Click
            Grid.SetColumn(btn, intColumn)
            Grid.SetRow(btn, intRow)
            orderPage.categoryGridPanel.Children.Add(btn)
            Debug.WriteLine(btn.Name & " " & intColumn, intRow)
            intColumn += 1
            If intColumn >= 2 Then
                intColumn = 0
                intRow += 1
            End If
        Next

    End Sub

    Public Sub PopulateItemButtons()
        'Makes a button for each menu item
        'Adds the button and its item to DctItemButtons
        'Buttons are actually added to the grid in the UpdateCategory function

        LstAllItems = dao.GetAllItems()
        For Each item As Item In LstAllItems
            Try
                Dim btn As New Button
                btn.Content = item.Name.Replace(" ", Environment.NewLine)
                btn.HorizontalContentAlignment = HorizontalAlignment.Center
                btn.Name = "btn" & item.Name.Replace(" ", "")
                btn.Height = 100
                btn.Width = 100
                btn.FontSize = 14
                btn.Style = CType(Application.Current.FindResource("RoundedButtonStyle"), Style)
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

    Public Sub PopulateOpenOnlineOrders()
        'Reset everything
        Dim intRow As Integer = 0
        Dim intColumn As Integer = 0
        dctOpenOnlineOrdersButtons.Clear()
        lstAllOpenOnlineOrders.Clear()
        OrderSelectionPage.onlineOrdersGrid.Children.Clear()
        'Get all the open online orders
        lstAllOpenOnlineOrders = dao.GetAllOpenOnlineOrders()
        'Makes a button for each open online order
        For Each order As Order In lstAllOpenOnlineOrders
            Try
                Dim user As New User
                user = dao.GetUser(order.UserId)
                Dim btn As New Button
                btn.Content = user.FirstName & " " & user.LastName & vbCrLf & order.OrderDate
                btn.HorizontalContentAlignment = HorizontalAlignment.Center
                btn.Name = "btn" & order.OrderId
                btn.Height = 70
                btn.Width = 160
                btn.FontSize = 14
                btn.Background = Brushes.Yellow
                btn.Style = CType(Application.Current.FindResource("RoundedButtonStyle"), Style)
                AddHandler btn.Click, AddressOf ViewOrderPageOnline
                dctOpenOnlineOrdersButtons.Add(btn, order)
            Catch ex As Exception
            End Try
        Next
        'Adds the button to the onlineOrdersGrid on the OrderSelectionpage
        For Each pair As KeyValuePair(Of Button, Order) In dctOpenOnlineOrdersButtons
            Grid.SetColumn(pair.Key, intColumn)
            Grid.SetRow(pair.Key, intRow)
            OrderSelectionPage.onlineOrdersGrid.Children.Add(pair.Key)
            intColumn += 1
            If intColumn >= 2 Then
                intColumn = 0
                intRow += 1
            End If
        Next

    End Sub

    Public Sub PopulateTableButtons()
        lstTableButtons.Add(OrderSelectionPage.btnTable101)
        lstTableButtons.Add(OrderSelectionPage.btnTable102)
        lstTableButtons.Add(OrderSelectionPage.btnTable103)
        lstTableButtons.Add(OrderSelectionPage.btnTable104)
        lstTableButtons.Add(OrderSelectionPage.btnTable201)
        lstTableButtons.Add(OrderSelectionPage.btnTable202)
        lstTableButtons.Add(OrderSelectionPage.btnTable203)
        lstTableButtons.Add(OrderSelectionPage.btnTable301)
        lstTableButtons.Add(OrderSelectionPage.btnTable302)
        lstTableButtons.Add(OrderSelectionPage.btnTable303)
        lstTableButtons.Add(OrderSelectionPage.btnTable401)
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
        Dim buttonColor As Brush
        intRow = 0
        intColumn = 0

        For Each button As Button In orderPage.categoryGridPanel.Children
            If button.Content.Equals(categoryName) Then
                buttonColor = button.Background
            End If
        Next

        'Remove all item buttons, change category header
        orderPage.itemGridPanel.Children.Clear()
        orderPage.lblCategoryHeader.Content = categoryName

        'If an item's category matches the string passed in then display its button
        For Each pair As KeyValuePair(Of Button, Item) In dctItemButtonsValue
            If pair.Value.Category.Equals(categoryName) Then
                pair.Key.Background = buttonColor
                Grid.SetColumn(pair.Key, intColumn)
                Grid.SetRow(pair.Key, intRow)
                orderPage.itemGridPanel.Children.Add(pair.Key)
                intColumn += 1
                If intColumn > 4 Then
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

        For Each item As Item In selectedOrder.LstItems
            subTotal = subTotal + item.Price
            For Each ingredient As Ingredient In item.Modifications
                If ingredient.Modification = 1 Then
                    subTotal = subTotal + ingredient.Price
                End If
            Next
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
    Public Sub ShowOrderSelectionPage()
        PopulateOpenOnlineOrders()
        lstOpenLocalOrders.Clear()
        lstOpenLocalOrders = dao.GetAllOpenLocalOrders()
        For Each tableButton As Button In lstTableButtons
            If GetLocalOrder(tableButton.Content) IsNot Nothing Then
                tableButton.Background = Brushes.Yellow
            Else
                tableButton.Background = Brushes.White
            End If
        Next
        OrderSelectionPage.lblClock.Content = DateTime.Now.ToString("hh:mm tt")
        OrderSelectionPage.lblUserName.Content = "Hello " & User.FirstName & " " & User.LastName
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
            If dao.GetUser(CType(pin, Integer)) IsNot Nothing Then
                User = New User(dao.GetUser(CType(pin, Integer)))
                ShowOrderSelectionPage()
            Else
                InvalidPin()
            End If
        End If

    End Sub

    Public Sub ViewOrderPageOnline(clickedBtn As Object, e As RoutedEventArgs)
        'Display the selected online order in the order page
        orderPage.lstBoxTicket.Items.Clear()
        orderPage.lblEmployeeName.Content = User.FirstName & " " & User.LastName
        orderPage.lblClock.Content = DateTime.Now.ToString("hh:mm tt")

        'Set selecetd order to the order associated with the clicked button
        selectedOrder = dctOpenOnlineOrdersButtons.Item(CType(clickedBtn, Button))
        For Each item As Item In selectedOrder.LstItems
            item.BuildTicketViewStrings()
            item.Sent = True
        Next
        DisplayOpenOrder(selectedOrder)
        UpdateCategory("Sandwich")
        ClearLables()
        UpdateTotals()
        MainWindow.Content = orderPage
    End Sub

    Public Sub ViewOrderPageLocal(location As String)
        Dim orderFound As Boolean = False
        orderPage.lstBoxTicket.Items.Clear()
        orderPage.lblEmployeeName.Content = User.FirstName & " " & User.LastName
        orderPage.lblClock.Content = DateTime.Now.ToString("hh:mm tt")

        'If there is already an open local order at that location then load that order
        If GetLocalOrder(location) IsNot Nothing Then
            selectedOrder = GetLocalOrder(location)
            For Each item As Item In selectedOrder.LstItems
                item.BuildTicketViewStrings()
                item.Sent = True
            Next
            DisplayOpenOrder(selectedOrder)
            orderFound = True
            Debug.WriteLine("Order found location " & location)
        End If

        'If there is not an open order at that location then make one
        If orderFound = False Then
            Dim order As New Order(location)
            'lstOpenLocalOrders.Add(order)
            selectedOrder = order
            dao.CreateOrder(selectedOrder, User.UserID)
            selectedOrder.OrderId = dao.GetHighestOrderId()
            Debug.WriteLine("No order found. New one created with id " & selectedOrder.OrderId)
        End If

        'Either way, clean up and display the order page
        UpdateCategory("Sandwich")
        ClearLables()
        UpdateTotals()
        MainWindow.Content = orderPage
    End Sub

    Public Sub ShowTakePaymentPopup()
        If selectedOrder.LstItems.Count > 0 Then
            takePaymentPopup.lblTotal.Content = "Total: $" & Math.Round(selectedOrder.Total, 2).ToString
            takePaymentPopup.Owner = Me.MainWindow
            takePaymentPopup.WindowStartupLocation = WindowStartupLocation.CenterOwner
            takePaymentPopup.ShowDialog()
        End If
    End Sub

    ''''''''''' Other Functions '''''''''''''

    Public Function GetLocalOrder(location As String) As Order
        'Return the order if one exists at the location
        'lstOpenLocalOrders.Clear()
        'lstOpenLocalOrders = dao.GetAllOpenLocalOrders()

        For Each order As Order In lstOpenLocalOrders
            If order.Location.Equals(location) Then
                Return order
            End If
        Next
        Return Nothing
    End Function

    Public Sub ToggleAddRemove()
        If addIngredientMode = True Then
            addIngredientMode = False
            ModifiersPopup.btnAddRemove.Background = Brushes.Red
            ModifiersPopup.btnAddRemove.Content = "Remove"
        Else
            addIngredientMode = True
            ModifiersPopup.btnAddRemove.Background = Brushes.Green
            ModifiersPopup.btnAddRemove.Content = "Add"
        End If
    End Sub

    Public Sub IngredientBtn_Click(sender As Object, e As RoutedEventArgs)
        Dim ingredientAlreadyCreated As Boolean = False
        Dim ingredient As New Ingredient()
        Dim lstAllIngredients = dao.GetAllIngredients()
        Dim lstDefaultIngredientIds = dao.GetDefaultIngredientIds(ModifiersPopup.SelectedItem)

        'Dont look at this
        'If you adding an already added item or removing an already removed item, don't do anything and exit.
        If CType(sender, Button).Background.Equals(ModifiersPopup.btnAddRemove.Background) Then
            Exit Sub
        End If

        If dctIngredientButtons.ContainsKey(CType(sender, Button)) Then
            'We only want to create a new ingredient if the ingredient isn't already on the item as a modification

            For Each modification As Ingredient In ModifiersPopup.SelectedItem.Modifications
                If dctIngredientButtons.Item(CType(sender, Button)).Id = modification.Id Then
                    'When this is true, the ingredient is already explicitly added or removed as a modifier
                    'Don't create a new one, use the one from the ingredientButton dictonary
                    ingredient = modification
                    ingredientAlreadyCreated = True
                    Exit For
                End If
            Next
            If ingredientAlreadyCreated = True Then
            End If

            'If the item doesn't already exist as a modification, create a new one
            If ingredientAlreadyCreated = False Then
                ingredient = New Ingredient(dctIngredientButtons.Item(CType(sender, Button)))
            End If


            'Set the modification values to indicate if the item is being added or removed
            If addIngredientMode = True Then
                ingredient.Modification = 1
            Else
                ingredient.Modification = 0
            End If

            'Change the color of the clicked button to match its added or removed status
            If addIngredientMode = True Then
                CType(sender, Button).Background = Brushes.Green
            Else
                CType(sender, Button).Background = Brushes.Red
            End If

            'If the ingredient was already in a modification on the item, remove it. Else, add the modification.
            If ingredientAlreadyCreated = True Then
                ModifiersPopup.SelectedItem.Modifications.Remove(ingredient)
            Else
                ModifiersPopup.SelectedItem.Modifications.Add(ingredient)
            End If
        End If
    End Sub

    Public Sub CategoryBtn_Click(sender As Object, e As RoutedEventArgs)
        UpdateCategory(CType(sender, Button).Content)
    End Sub

    Public Sub AddItem(selectedItem As Item)
        If selectedItem.EditedFlag = False Then
            'If the item is being added for the first time, not being edited
            selectedOrder.LstItems.Add(selectedItem)
            orderPage.lstBoxTicket.Items.Add(selectedItem)
            orderPage.lstBoxTicket.SelectedItem = selectedItem
            selectedItem.EditedFlag = True
        End If
        selectedItem.BuildTicketViewStrings()
        UpdateTotals()
        orderPage.lstBoxTicket.Items.Refresh()
    End Sub

    Public Sub StartItem(clickedBtn As Object, e As RoutedEventArgs)
        'Uses DctItemButtons to find and create the correct item to use based on which button was clicked
        If DctItemButtons.ContainsKey(clickedBtn) Then
            Dim selectedItem As Item = New Item(DctItemButtons.Item(clickedBtn))
            ModifiersPopup.SelectedItem = selectedItem
            PopulateIngredientButtons()
            FilterIngredientCategory("Default")
            ModifiersPopup.btnAddRemove.Background = Brushes.Green
            ModifiersPopup.btnAddRemove.Content = "Add"
            addIngredientMode = True
            ModifiersPopup.Owner = Me.MainWindow
            ModifiersPopup.WindowStartupLocation = WindowStartupLocation.CenterOwner
            ModifiersPopup.ShowDialog()
        End If
    End Sub

    Public Sub EditItem()
        ModifiersPopup.SelectedItem = orderPage.lstBoxTicket.SelectedItem
        ModifiersPopup.ShowDialog()
    End Sub

    Public Sub FilterIngredientCategory(category As String)
        ModifiersPopup.ingredientGridPanel.Children.Clear()
        Dim lstDefaultIngredientIds As New List(Of Integer)
        Dim intColumn As Integer = 0
        Dim intRow As Integer = 0
        lstDefaultIngredientIds = dao.GetDefaultIngredientIds(ModifiersPopup.SelectedItem)

        'If the on the default tab, use a different method to decied what to display
        If category.Equals("Default") = True Then
            For Each pair As KeyValuePair(Of Button, Ingredient) In dctIngredientButtons
                For Each id As Integer In lstDefaultIngredientIds
                    If pair.Value.Id.Equals(id) Then
                        Grid.SetRow(pair.Key, intRow)
                        Grid.SetColumn(pair.Key, intColumn)
                        ModifiersPopup.ingredientGridPanel.Children.Add(pair.Key)
                        intColumn += 1
                        If intColumn >= 7 Then
                            intRow += 1
                            intColumn = 0
                        End If
                    End If
                Next
            Next
        Else
            For Each pair As KeyValuePair(Of Button, Ingredient) In dctIngredientButtons
                If pair.Value.Category.Equals(category) Then
                    Grid.SetRow(pair.Key, intRow)
                    Grid.SetColumn(pair.Key, intColumn)
                    ModifiersPopup.ingredientGridPanel.Children.Add(pair.Key)
                    intColumn += 1
                    If intColumn >= 7 Then
                        intRow += 1
                        intColumn = 0
                    End If
                End If
            Next
        End If
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
        dao.SendItems(selectedOrder, User.UserID)

        'Changes the Sent property on non sent items so that they highlight to blue on the ticket view
        For Each item As Item In selectedOrder.LstItems
            If item.Sent = False Then
                item.Sent = True
            End If
        Next
    End Sub

    Public Sub TakePayment()
        'Dim result As MessageBoxResult
        'result = MessageBox.Show("Cashout Order?" & vbCrLf & "Total: $" & Math.Round(selectedOrder.Total, 2).ToString, "Take Payment", MessageBoxButton.YesNo)
        'If result = MessageBoxResult.Yes Then
        'Close the order
        selectedOrder.IsOpen = 0
            dao.CloseOrder(selectedOrder)
            lstOpenLocalOrders.Remove(selectedOrder)
            'Go back to the order selection page
            ShowOrderSelectionPage()
        'End If
    End Sub

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
