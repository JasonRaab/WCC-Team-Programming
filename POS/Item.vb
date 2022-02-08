Public Class Item

    Public Sub New(Item_id As Integer, Name As String, Category As String, Price As Decimal)
        Me.Item_id = Item_id
        Me.Name = Name
        Me.Category = Category
        Me.Price = Price
    End Sub

    Public Sub New(item As Item)
        'Copy constructor
        Me.Item_id = item.Item_id
        Me.Name = item.Name
        Me.Category = item.Category
        Me.Price = item.Price
    End Sub

    Private item_idValue As Integer
    Private nameValue As String
    Private categoryValue As String
    Private priceValue As Decimal

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

End Class
