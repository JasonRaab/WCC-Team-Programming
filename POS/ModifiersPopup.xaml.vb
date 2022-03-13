Public Class ModifiersPopup

    Private posApp As POSApp
    Private selectedItem As Item

    Public Sub New(posApp As POSApp, selectedItem As Item)
        InitializeComponent()
        Me.posApp = posApp
        Me.selectedItem = selectedItem
    End Sub

    Private Sub BtnOk_Click(sender As Object, e As RoutedEventArgs) Handles btnOk.Click
        posApp.AddItem(selectedItem)
        Me.Close()
    End Sub

    Private Sub BtnCancel_Click(sender As Object, e As RoutedEventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub
End Class
