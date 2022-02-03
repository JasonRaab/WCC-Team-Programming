Imports MySql.Data.MySqlClient

Class MainWindow
    Dim connection As New MySqlConnection("datasource=localhost;port=3306;username=hbstudent;password=hbstudent")
    Dim command As New MySqlCommand
    Dim reader As MySqlDataReader

    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
        'Runs when program opens
        'Opens connections, sets and executes query
        connection.Open()
        command.Connection = connection
        command.CommandText = "SELECT * FROM cps298.item"
        reader = command.ExecuteReader

        'Creates a button for each item in database
        While reader.Read
            Dim btn As New Button
            btn.Content = reader.GetString("name")
            btn.Name = "btn" & reader.GetString("name")
            btn.Height = 50
            btn.Width = 50
            AddHandler btn.Click, AddressOf Button_Click
            stackPanel.Children.Add(btn)
            'gridPanel.set
        End While

        connection.Close()
    End Sub

    Private Sub listBox_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles listBox.SelectionChanged
        'Runs when the list box's selection changes IF something is selected
        'Opens connections, sets and executes query
        If listBox.SelectedItem IsNot Nothing Then
            connection.Open()
            command.CommandText = "SELECT * FROM cps298.item WHERE name = '" & listBox.SelectedItem.ToString & "'"
            reader = command.ExecuteReader

            'Changes text of lables based on which item is clicked in the list box
            If reader.Read Then
                lblId.Content = reader.GetString("item_id")
                lblName.Content = reader.GetString("name")
                lblCategory.Content = reader.GetString("category")
                lblPrice.Content = reader.GetString("price")
            End If

            connection.Close()
        End If
    End Sub

    Private Sub Button_Click(sender As Object, e As RoutedEventArgs)
        'Runs when a menu item buttons is clicked
        'Opens connections, sets and executes query
        connection.Open()
        command.CommandText = "SELECT * FROM cps298.item WHERE name = '" & CType(sender, Button).Content & "'"
        reader = command.ExecuteReader

        'Changes text of lables based on which item is clicked in the list box
        If reader.Read Then
            listBox.Items.Add(reader.GetString("name"))
            lblId.Content = reader.GetString("item_id")
            lblName.Content = reader.GetString("name")
            lblCategory.Content = reader.GetString("category")
            lblPrice.Content = reader.GetString("price")
        End If

        connection.Close()
    End Sub

    Private Sub Button_Click_1(sender As Object, e As RoutedEventArgs)

    End Sub

    Private Sub btnDelete_Click(sender As Object, e As RoutedEventArgs) Handles btnDelete.Click
        listBox.Items.Remove(listBox.SelectedItem)
    End Sub
End Class
