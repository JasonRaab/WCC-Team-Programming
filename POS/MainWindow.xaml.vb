﻿Class MainWindow

    Dim posApp As POSApp

    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
        posApp = New POSApp(Me)
        posApp.PopulateItemButtons()
    End Sub

    Private Sub LstBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstBoxTicket.SelectionChanged
        posApp.LstBox_SelectionChanged(sender, e)
    End Sub

    Private Sub BtnDelete_Click(sender As Object, e As RoutedEventArgs) Handles btnDelete.Click
        lstBoxTicket.Items.Remove(lstBoxTicket.SelectedItem)

    End Sub

End Class