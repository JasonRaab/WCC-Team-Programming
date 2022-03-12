Class MainWindow

    Private locationValue As String

    Public Property Location
        Get
            Return locationValue
        End Get
        Set(value)
            locationValue = value
        End Set
    End Property

    Dim posApp As POSApp

    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
        posApp = New POSApp(Me)
    End Sub

End Class
