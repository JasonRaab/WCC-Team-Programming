﻿Class LoginPage

    Private posApp As POSApp
    Private pin As String

    Public Sub New(ByRef posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
        pin = ""
    End Sub

    Private Sub BtnGo_Click(sender As Object, e As RoutedEventArgs) Handles btnGo.Click
        posApp.LoginPageGo(pin)
        pin = ""
        lblPin.Content = ""
    End Sub

    Private Sub btnNumberPad_Click(sender As Object, e As RoutedEventArgs) Handles btn1.Click, btn2.Click, btn3.Click, btn4.Click, btn5.Click, btn6.Click, btn7.Click, btn8.Click, btn9.Click, btn0.Click
        lblPin.Content = lblPin.Content & "*"
        pin = pin & CType(sender, Button).Content
        Debug.WriteLine("Button " & CType(sender, Button).Content & " pressed")
        Debug.WriteLine("PIN is now " & pin)
    End Sub

    Private Sub btnClear_Click(sender As Object, e As RoutedEventArgs) Handles btnClear.Click
        pin = ""
        lblPin.Content = ""
    End Sub

    Private Sub btnBackSpace_Click(sender As Object, e As RoutedEventArgs) Handles btnBackSpace.Click
        If pin.Length > 0 Then
            pin = pin.Trim().Remove(pin.Length - 1)
            lblPin.Content = lblPin.Content.Trim().Remove(lblPin.Content.Length - 1)
        End If
    End Sub
End Class
