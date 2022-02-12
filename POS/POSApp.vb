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

    Private mainWindowValue As MainWindow
    Private orderSelectionpageValue As OrderSelectionPage
    Private dao As DAO
    Private lstAllItemsValue As New List(Of Item)
    Private dctItemButtonsValue As New Dictionary(Of Button, Item)
    Private order As Order

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
        Me.MainWindow = MainWindow
        OrderSelectionPage = New OrderSelectionPage()
        order = New Order()
        dao = New DAO("datasource=167.172.242.79;port=3306;username=testUser;password=test@password298")
        Me.MainWindow.lstBoxTicket.Items.Clear()
        PopulateCategoryButtons()
        PopulateItemButtons()
        PopulateLstBoxTotals()
        UpdateCategory("Entree")
        order.SubTotal = 0.00
    End Sub


    '''''''''' Populating Functions ''''''''''
    Public Sub PopulateCategoryButtons()
        Dim intRow As Integer
        Dim lstCateGories As List(Of String)
        intRow = 0
        lstCategories = dao.GetCategories()

        For Each category As String In lstCategories
            Dim btn As New Button
            btn.Content = category
            btn.Name = "btn" & category.Replace(" ", "")
            btn.Height = 125
            btn.Width = 125
            btn.FontSize = 18
            AddHandler btn.Click, AddressOf CategoryBtn_Click
            Grid.SetRow(btn, intRow)
            MainWindow.categoryGridPanel.Children.Add(btn)
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
        MainWindow.lstBoxTotals.Items.Add("SubTotal:")
        MainWindow.lstBoxTotals.Items.Add("Tax:")
        MainWindow.lstBoxTotals.Items.Add("Total:")
    End Sub

    '''''''''' Updating Functions ''''''''''
    Public Sub UpdateCategory(categoryName As String)
        Dim intRow As Integer
        Dim intColumn As Integer
        intRow = 0
        intColumn = 0



        'Remove all item buttons, change category header
        MainWindow.itemGridPanel.Children.Clear()
        MainWindow.lblCategoryHeader.Content = categoryName & "s"

        'If an item's category matches the string passed in then display its button
        For Each pair As KeyValuePair(Of Button, Item) In dctItemButtonsValue
            If pair.Value.Category.Equals(categoryName) Then
                Grid.SetColumn(pair.Key, intColumn)
                Grid.SetRow(pair.Key, intRow)
                MainWindow.itemGridPanel.Children.Add(pair.Key)
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

        For Each item As Item In MainWindow.lstBoxTicket.Items
            subTotal = subTotal + item.Price
        Next
        tax = subTotal * 0.06
        total = subTotal + tax
        MainWindow.lstBoxTotals.Items.Clear()
        MainWindow.lstBoxTotals.Items.Add("SubTotal:                                 " & Math.Round(subTotal, 2).ToString)
        MainWindow.lstBoxTotals.Items.Add("Tax:                                        " & Math.Round(tax, 2).ToString)
        MainWindow.lstBoxTotals.Items.Add("Total:                                  " & Math.Round(total, 2).ToString)
        order.SubTotal = subTotal
        order.Tax = tax
        order.Total = total
    End Sub

    Private Sub UpdateLables(item As Item)
        If TypeOf item Is Item Then
            MainWindow.lblId.Content = item.Item_id
            MainWindow.lblName.Content = item.Name
            MainWindow.lblCategory.Content = item.Category
            MainWindow.lblPrice.Content = item.Price
        End If
    End Sub

    Public Sub ViewOrderPage(location As String)
        MainWindow.Content = MainWindow
    End Sub

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

        order.LstItems.Add(selectedItem)
        MainWindow.lstBoxTicket.Items.Add(selectedItem)
        MainWindow.lstBoxTicket.SelectedItem = selectedItem
        UpdateTotals()
    End Sub

    Public Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs)
        'Rename this method
        'Runs when the list box's selection changes IF something is selected

        If TypeOf MainWindow.lstBoxTicket.SelectedItem Is Item Then
            UpdateLables(MainWindow.lstBoxTicket.SelectedItem)
        End If
    End Sub

    Public Sub ClearTicket()
        MainWindow.lstBoxTicket.Items.Clear()
        order.LstItems.Clear()
        ClearLables()
    End Sub

    Private Sub ClearLables()
        MainWindow.lblId.Content = "-"
        MainWindow.lblName.Content = "-"
        MainWindow.lblCategory.Content = "-"
        MainWindow.lblPrice.Content = "-"
    End Sub

    Public Sub SendOrder()
        'dao.SendOrder(order)
        dao.SendTestOrder(order)
    End Sub

    Public Sub ExitOrderPage()
        MainWindow.Content = OrderSelectionPage
    End Sub

    Public Sub TakePayment()

    End Sub

End Class
