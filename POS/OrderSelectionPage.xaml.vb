Class OrderSelectionPage

    Private posApp As POSApp

    Public Sub New(ByVal posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
    End Sub

    Private Sub btnTable_Click(sender As Object, e As RoutedEventArgs) Handles btnTable1.Click, btnTable2.Click, btnTable3.Click, btnTable4.Click
        posApp.ViewOrderPage(CType(sender, Button).Content)
    End Sub

    Private Sub Page_Loaded(sender As Object, e As RoutedEventArgs)

    End Sub

    Private Sub btn(sender As Object, e As RoutedEventArgs)

    End Sub

    Private Sub btnExit_Click(sender As Object, e As RoutedEventArgs) Handles btnExit.Click
        posApp.ExitOrderSelectionPage()
    End Sub
End Class
