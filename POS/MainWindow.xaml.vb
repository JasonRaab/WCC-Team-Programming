Class MainWindow

    Dim posApp As POSApp

    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
        posApp = New POSApp(Me)
        posApp.PopulateItemButtons()
    End Sub

    Private Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstBox.SelectionChanged
        posApp.LstBox_SelectionChanged(sender, e)
    End Sub

    Private Sub BtnDelete_Click(sender As Object, e As RoutedEventArgs) Handles btnDelete.Click
        lstBox.Items.Remove(lstBox.SelectedItem)

    End Sub

End Class
