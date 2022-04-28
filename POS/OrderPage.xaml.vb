Class OrderPage
    Private posApp As POSApp

    Public Sub New(ByVal posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
    End Sub

    Private Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstBoxTicket.SelectionChanged
        posApp.LstBox_SelectionChanged(sender, e)
    End Sub

    Private Sub btnDelete_Click(sender As Object, e As RoutedEventArgs) Handles btnDelete.Click
        posApp.DeleteItem()
    End Sub

    Private Sub btnDeleteAll_Click(sender As Object, e As RoutedEventArgs) Handles btnDeleteAll.Click
        posApp.ClearTicket()
    End Sub

    Private Sub btnSendOrder_Click(sender As Object, e As RoutedEventArgs) Handles btnSendOrder.Click
        posApp.SendOrder()
    End Sub

    Private Sub btnTakePayment_Click(sender As Object, e As RoutedEventArgs) Handles btnTakePayment.Click
        posApp.ShowTakePaymentPopup()
    End Sub

    Private Sub btnExit_Click(sender As Object, e As RoutedEventArgs) Handles btnExit.Click
        posApp.ShowOrderSelectionPage()
    End Sub

    Private Sub lstBoxTicket_MouseDoubleClick(sender As Object, e As MouseButtonEventArgs) Handles lstBoxTicket.MouseDoubleClick
        posApp.EditItem()
    End Sub
End Class
