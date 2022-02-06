''' <summary>
''' To Do Front End:
''' Display individual item price in list box
'''     The best way to do this might be to use a dataTemplate for the item class
'''     Then, we would use the lstBox.Items as the list for the selecetd items
'''     We would not have a sperate List(Of Item) for selected items. Still learning about this.
''' Display sub total, tax, and total below list box
''' Make sperate tabs for item categories
''' 
''' To Do Backend:
''' Store list of selected Items in a List(Of Item)
''' Send orders to database
''' 
''' Other Notes:
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
        dao = New DAO("datasource=localhost;port=3306;username=hbstudent;password=hbstudent")
        lstAllItems = dao.GetAllItems()
        MainWindow.lstBoxTicket.Items.Clear()
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
    End Sub

    Public Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs)
        'Runs when the list box's selection changes IF something is selected

        If TypeOf MainWindow.lstBoxTicket.SelectedItem Is Item Then
            UpdateLables(MainWindow.lstBoxTicket.SelectedItem)
        End If
    End Sub

    Public Sub UpdateLables(item As Item)
        If TypeOf item Is Item Then
            MainWindow.lblId.Content = item.Item_id
            MainWindow.lblName.Content = item.Name
            MainWindow.lblCategory.Content = item.Category
            MainWindow.lblPrice.Content = item.Price
        End If
    End Sub

End Class
