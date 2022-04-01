Imports System.ComponentModel

Public Class Item
    Implements INotifyPropertyChanged
    Public Event PropertyChanged As PropertyChangedEventHandler Implements INotifyPropertyChanged.PropertyChanged

    Public Overridable Sub OnPropertyChanged(ByVal propertyName As String)
        RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
    End Sub

    Private sentValue As Boolean
    Private item_idValue As Integer
    Private nameValue As String
    Private categoryValue As String
    Private priceValue As Decimal
    Private modificationsValue As List(Of Ingredient)
    Private defaultIngredientsValue As List(Of Ingredient)


    Public Property Sent() As Boolean
        Get
            Return sentValue
        End Get
        Set(value As Boolean)
            sentValue = value
            OnPropertyChanged("Sent")
        End Set
    End Property

    Public Property Item_id() As Integer
        Get
            Return item_idValue
        End Get
        Set(value As Integer)
            item_idValue = value
        End Set
    End Property
    Public Property Name() As String
        Get
            Return nameValue
        End Get
        Set(value As String)
            nameValue = value
        End Set
    End Property
    Public Property Category() As String
        Get
            Return categoryValue
        End Get
        Set(value As String)
            categoryValue = value
        End Set
    End Property
    Public Property Price() As Decimal
        Get
            Return priceValue
        End Get
        Set(value As Decimal)
            priceValue = value
        End Set
    End Property
    Public Property Modifications() As List(Of Ingredient)
        Get
            Return modificationsValue
        End Get
        Set(value As List(Of Ingredient))
            modificationsValue = value
        End Set
    End Property
    Public Property DefaultIngredients() As List(Of Ingredient)
        Get
            Return defaultIngredientsValue
        End Get
        Set(value As List(Of Ingredient))
            defaultIngredientsValue = value
        End Set
    End Property

    Public Sub New(Item_id As Integer, Name As String, Category As String, Price As Decimal)
        Me.Item_id = Item_id
        Me.Name = Name
        Me.Category = Category
        Me.Price = Price
        Me.Sent = False
        Me.Modifications = New List(Of Ingredient)
    End Sub

    Public Sub New(Item_id As Integer, Name As String, Category As String, Price As Decimal, DefaultIngredients As List(Of Ingredient))
        Me.Item_id = Item_id
        Me.Name = Name
        Me.Category = Category
        Me.Price = Price
        Me.Sent = False
        Me.DefaultIngredients = DefaultIngredients
    End Sub

    Public Sub New(ByVal item As Item)
        'Copy constructor
        Me.Item_id = item.Item_id
        Me.Name = item.Name
        Me.Category = item.Category
        Me.Price = item.Price
        Me.Sent = False
        Me.Modifications = item.Modifications
    End Sub

End Class
