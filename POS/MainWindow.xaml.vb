Class MainWindow

    Private locationValue As String

    Public Property Location
        Get
            Return locationValue
        End Get
        Set(value)
            locationValue = value
        End Set
    End Property

    Dim posApp As POSApp

    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
        posApp = New POSApp(Me)
    End Sub

    'Private Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstBoxTicket.SelectionChanged
    '    posApp.LstBox_SelectionChanged(sender, e)
    'End Sub

    'Private Sub btnDelete_Click(sender As Object, e As RoutedEventArgs) Handles btnDelete.Click
    '    lstBoxTicket.Items.Remove(lstBoxTicket.SelectedItem)
    'End Sub

    'Private Sub btnDeleteAll_Click(sender As Object, e As RoutedEventArgs) Handles btnDeleteAll.Click
    '    MessageBox.Show("Make this an Are You Sure box")
    '    posApp.ClearTicket()
    'End Sub

    'Private Sub btnSendOrder_Click(sender As Object, e As RoutedEventArgs) Handles btnSendOrder.Click
    '    posApp.SendOrder()
    'End Sub

    'Private Sub btnTakePayment_Click(sender As Object, e As RoutedEventArgs) Handles btnTakePayment.Click
    '    posApp.TakePayment()
    'End Sub

    'Private Sub btnExit_Click(sender As Object, e As RoutedEventArgs) Handles btnExit.Click
    '    posApp.ExitOrderPage()
    'End Sub
End Class
