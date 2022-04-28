Class TakePaymentPopup

    Private posApp As POSApp
    Public Sub New(posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
    End Sub

    Private Sub btnCash_Click(sender As Object, e As RoutedEventArgs) Handles btnCash.Click
        posApp.TakePayment()
        Me.Hide()
    End Sub

    Private Sub btnCard_Click(sender As Object, e As RoutedEventArgs) Handles btnCard.Click
        posApp.TakePayment()
        Me.Hide()
    End Sub

    Private Sub btnCancel_Click(sender As Object, e As RoutedEventArgs) Handles btnCancel.Click
        Me.Hide()
    End Sub
End Class
