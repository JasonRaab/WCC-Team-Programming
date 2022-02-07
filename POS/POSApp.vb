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
    Private dao As DAO
    Private lstAllItemsValue As New List(Of Item)
    Private lstSelectedItemsValue As New List(Of Item)

    Public Sub New(MainWindow As MainWindow)
        Me.MainWindow = MainWindow
        'dao = New DAO("datasource=localhost;port=3306;username=hbstudent;password=hbstudent")
        dao = New DAO("datasource=167.172.242.79;port=3306;username=testUser;password=test@password298")
        lstAllItems = dao.GetAllItems()
        Me.MainWindow.lstBoxTicket.Items.Clear()
        PopulateItemButtons()
        PopulateLstBoxTotals()
    End Sub

    Public Property lstAllItems() As List(Of Item)
        Get
            Return lstAllItemsValue
        End Get
        Set(value As List(Of Item))
            lstAllItemsValue = value
        End Set
    End Property
    Public Property lstSelectedItems() As List(Of Item)
        Get
            Return lstSelectedItemsValue
        End Get
        Set(value As List(Of Item))
            lstSelectedItemsValue = value
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

    Public Sub PopulateItemButtons()
        'Makes a button for each menu item
        Dim intColumn As Integer
        Dim intRow As Integer
        intColumn = 0
        intRow = 0

        For Each item As Item In lstAllItems
            Dim btn As New Button
            btn.Content = item.Name
            btn.Name = "btn" & item.Name
            btn.Height = 125
            btn.Width = 125
            btn.FontSize = 18
            AddHandler btn.Click, AddressOf AddItem

            'This block is for looping through the grid that the buttons are placed on
            'There must be a better way to do this
            For intRow = intRow To 4
                For intColumn = intColumn To 4
                    Grid.SetColumn(btn, intColumn)
                    Grid.SetRow(btn, intRow)
                    MainWindow.gridPanel.Children.Add(btn)
                    intColumn += 1
                    If intColumn > 4 Then
                        intColumn = 0
                        intRow += 1
                    End If
                    Exit For
                Next
                Exit For
            Next
        Next
    End Sub
    Public Sub PopulateLstBoxTotals()
        MainWindow.lstBoxTotals.Items.Add("SubTotal:")
        MainWindow.lstBoxTotals.Items.Add("Tax:")
        MainWindow.lstBoxTotals.Items.Add("Total:")
    End Sub

    Public Sub AddItem(sender As Object, e As RoutedEventArgs)
        Dim selectedItem As Item

        'Finds which item was clicked using text on the button
        For Each item As Item In lstAllItems
            If item.Name.Equals(CType(sender, Button).Content) Then
                selectedItem = New Item(item)
                Exit For
            End If
        Next

        lstSelectedItems.Add(selectedItem)
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
        ClearLables()
    End Sub

    Private Sub UpdateLables(item As Item)
        If TypeOf item Is Item Then
            MainWindow.lblId.Content = item.Item_id
            MainWindow.lblName.Content = item.Name
            MainWindow.lblCategory.Content = item.Category
            MainWindow.lblPrice.Content = item.Price
        End If
    End Sub

    Private Sub ClearLables()
        MainWindow.lblId.Content = "-"
        MainWindow.lblName.Content = "-"
        MainWindow.lblCategory.Content = "-"
        MainWindow.lblPrice.Content = "-"
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

    End Sub

End Class
