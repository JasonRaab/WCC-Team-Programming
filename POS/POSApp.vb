''' <summary>
''' To Do Front End:
''' Display totals in a nicer way. Probably a dataTemplate like in lstBoxTicket
''' Make sperate tabs for item categories
''' 
''' To Do Backend:
''' Hook up to the correct database
''' Send orders to database
'''     Should probably make an order object
''' 
''' Other Notes:
''' lstSelectedItems might not need to exist, I'm not sure. We might just want to use lstBoxTicket.Items
''' The logic for the event handlers on MainWindow should be in POSApp.
''' Extra Functionality - Make it store menu in XML so that it can run without db connection.
''' </summary>

Public Class POSApp

    Private loginPageValue As LoginPage
    Private mainWindowValue As MainWindow
    Private orderSelectionpageValue As OrderSelectionPage
    Private dao As DAO
    Private lstAllItemsValue As New List(Of Item)
    Private dctItemButtonsValue As New Dictionary(Of Button, Item)
    Private orderPage As OrderPage
    Private lstOpenOrders As New List(Of Order)
    Private lstClosedOrders As New List(Of Order)
    Private selectedOrder As New Order

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

    Public Sub New(MainWindow As MainWindow)
        'Create all pages and dao. Populate various things for order page. Show login page.
        Me.MainWindow = MainWindow
        LoginPage = New LoginPage(Me)
        OrderSelectionPage = New OrderSelectionPage(Me)
        orderPage = New OrderPage(Me)
        dao = New DAO("datasource=167.172.242.79;port=3306;username=testUser;password=test@password298")
        PopulateCategoryButtons()
        PopulateItemButtons()
        PopulateLstBoxTotals()
        MainWindow.Content = LoginPage
    End Sub


    '''''''''' Populating Functions ''''''''''
    Public Sub PopulateCategoryButtons()
        Dim intRow As Integer
        Dim lstCateGories As List(Of String)
        intRow = 0
        lstCateGories = dao.GetCategories()

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
        Dim intColumn As Integer
        Dim intRow As Integer
        intColumn = 0
        intRow = 0

        LstAllItems = dao.GetAllItems()
        For Each item As Item In LstAllItems
            Dim btn As New Button
            btn.Content = item.Name
            btn.Name = "btn" & item.Name.Replace(" ", "")
            btn.Height = 125
            btn.Width = 125
            btn.FontSize = 18
            AddHandler btn.Click, AddressOf AddItem
            DctItemButtons.Add(btn, item)
        Next
    End Sub

    Public Sub PopulateLstBoxTotals()
        orderPage.lstBoxTotals.Items.Add("SubTotal:")
        orderPage.lstBoxTotals.Items.Add("Tax:")
        orderPage.lstBoxTotals.Items.Add("Total:")
    End Sub

    Public Sub PopulateOpenOrder(order As Order)
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
        'MainWindow.itemGridPanel.Children.Clear()
        'MainWindow.lblCategoryHeader.Content = categoryName & "s"
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

    Public Sub LoginPageGo()
        MainWindow.Content = OrderSelectionPage
    End Sub

    Public Sub ViewOrderPage(location As String)
        Dim orderFound As Boolean = False
        orderPage.lstBoxTicket.Items.Clear()

        'If there is already an open order at that location then load that order
        For Each order As Order In lstOpenOrders
            If order.Location.Equals(location) Then
                selectedOrder = order
                PopulateOpenOrder(order)
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

    Public Sub CategoryBtn_Click(sender As Object, e As RoutedEventArgs)
        UpdateCategory(CType(sender, Button).Content)
    End Sub

    Public Sub AddItem(sender As Object, e As RoutedEventArgs)
        Dim selectedItem As Item

        For Each pair As KeyValuePair(Of Button, Item) In DctItemButtons
            If sender.Equals(pair.Key) Then
                selectedItem = New Item(pair.Value)
            End If
        Next

        selectedOrder.LstItems.Add(selectedItem)
        orderPage.lstBoxTicket.Items.Add(selectedItem)
        orderPage.lstBoxTicket.SelectedItem = selectedItem
        UpdateTotals()
    End Sub

    Public Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs)
        'Rename this method
        'Runs when the list box's selection changes IF something is selected

        If TypeOf orderPage.lstBoxTicket.SelectedItem Is Item Then
            UpdateLables(orderPage.lstBoxTicket.SelectedItem)
        End If
    End Sub

    Public Sub ClearTicket()
        orderPage.lstBoxTicket.Items.Clear()
        selectedOrder.LstItems.Clear()
        ClearLables()
        UpdateTotals()
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
        'dao.SendOrder(order)
        dao.SendTestOrder(selectedOrder)
    End Sub

    Public Sub TakePayment()

    End Sub

End Class
