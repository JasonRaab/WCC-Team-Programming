Public Class ModifiersPopup

    Private posApp As POSApp
    Private selectedItemValue As Item
    Public Property SelectedItem() As Item
        Get
            Return selectedItemValue
        End Get
        Set(value As Item)
            selectedItemValue = value
        End Set
    End Property

    Public Sub New(posApp As POSApp)
        InitializeComponent()
        Me.posApp = posApp
    End Sub

    Private Sub BtnOk_Click(sender As Object, e As RoutedEventArgs) Handles btnOk.Click
        posApp.AddItem(selectedItem)
        Me.Hide()
    End Sub

    Private Sub BtnCancel_Click(sender As Object, e As RoutedEventArgs) Handles btnCancel.Click
        Me.Hide()
    End Sub

    Private Sub IngredientCategory_Click(sender As Object, e As RoutedEventArgs) Handles btnVegetable.Click, btnProtein.Click, btnCondiment.Click, btnDairy.Click, btnBread.Click, btnFruit.Click, btnDessert.Click, btnDefault.Click
        Me.posApp.FilterIngredientCategory(CType(sender, Button).Content)
    End Sub

    Private Sub btnAddRemove_Click(sender As Object, e As RoutedEventArgs) Handles btnAddRemove.Click
        Me.posApp.ToggleAddRemove()
    End Sub
End Class
