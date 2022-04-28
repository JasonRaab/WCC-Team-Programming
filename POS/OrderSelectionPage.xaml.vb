Class OrderSelectionPage

    Private posApp As POSApp

    Public Sub New(ByVal posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
    End Sub

    Private Sub btnTable_Click(sender As Object, e As RoutedEventArgs) Handles btnTable101.Click, btnTable102.Click, btnTable103.Click, btnTable104.Click, btnTable201.Click, btnTable202.Click, btnTable203.Click, btnTable301.Click, btnTable302.Click, btnTable303.Click, btnTable401.Click
        posApp.ViewOrderPageLocal(CType(sender, Button).Content)
    End Sub

    Private Sub Page_Loaded(sender As Object, e As RoutedEventArgs)

    End Sub

    Private Sub btnExit_Click(sender As Object, e As RoutedEventArgs) Handles btnExit.Click
        posApp.ExitOrderSelectionPage()
    End Sub
End Class
