Class MainWindow

    Dim posApp As POSApp

    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
        posApp = New POSApp(Me)
    End Sub

    Private Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstBoxTicket.SelectionChanged
        posApp.LstBox_SelectionChanged(sender, e)
    End Sub

    Private Sub BtnDelete_Click(sender As Object, e As RoutedEventArgs) Handles btnDelete.Click
        lstBoxTicket.Items.Remove(lstBoxTicket.SelectedItem)
    End Sub

    Private Sub btnDeleteAll_Click(sender As Object, e As RoutedEventArgs) Handles btnDeleteAll.Click
        MessageBox.Show("Make this an Are You Sure box")
        posApp.ClearTicket()
    End Sub

    Private Sub btnTestOrder_Click(sender As Object, e As RoutedEventArgs) Handles btnTestOrder.Click
        posApp.SendTestOrder()
    End Sub

    Private Sub btnSendOrder_Click(sender As Object, e As RoutedEventArgs) Handles btnSendOrder.Click
        posApp.SendOrder()
    End Sub
End Class
