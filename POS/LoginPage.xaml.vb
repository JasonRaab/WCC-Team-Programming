Class LoginPage

    Private posApp As POSApp

    Public Sub New(ByRef posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
    End Sub

    Private Sub BtnGo_Click(sender As Object, e As RoutedEventArgs) Handles btnGo.Click
        posApp.LoginPageGo()
    End Sub
End Class
