Class OrderSelectionPage

    Private posApp As POSApp

    'Public Sub New(posApp As POSApp)
    '    Me.posApp = posApp
    'End Sub

    Private Sub btnTable_Click(sender As Object, e As RoutedEventArgs) Handles btnTable1.Click
        posApp.ViewOrderPage(CType(sender, Button).Content)
    End Sub

    Private Sub Page_Loaded(sender As Object, e As RoutedEventArgs)

    End Sub

End Class
