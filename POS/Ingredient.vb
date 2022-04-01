Public Class Ingredient

    Private idValue As Integer
    Private nameValue As String
    Private categoryValue As String
    Private stockValue As Integer
    Private priceValue As Decimal
    Private isActiveValue As Boolean
    Private modificationValue As Integer


    Public Sub New(Id As Integer, Name As String, Category As String, Stock As Integer, Price As Decimal, IsActive As Integer)
        Me.Id = Id
        Me.Name = Name
        Me.Category = Category
        Me.Stock = Stock
        Me.Price = Price
        If IsActive = 1 Then
            Me.IsActive = True
        Else
            Me.IsActive = False
        End If
    End Sub

    Public Sub New(Id As Integer, Modification As Integer)
        Me.Id = Id
        Me.Modification = Modification
    End Sub

    Public Property Modification As Integer
        Get
            Return modificationValue
        End Get
        Set(value As Integer)
            modificationValue = value
        End Set
    End Property

    Public Property Id As Integer
        Get
            Return idValue
        End Get
        Set(value As Integer)
            idValue = value
        End Set
    End Property
    Public Property Name As String
        Get
            Return nameValue
        End Get
        Set(value As String)
            nameValue = value
        End Set
    End Property
    Public Property Category As String
        Get
            Return categoryValue
        End Get
        Set(value As String)
            categoryValue = value
        End Set
    End Property
    Public Property Stock As Integer
        Get
            Return stockValue
        End Get
        Set(value As Integer)
            stockValue = value
        End Set
    End Property
    Public Property Price As Decimal
        Get
            Return priceValue
        End Get
        Set(value As Decimal)
            priceValue = value
        End Set
    End Property
    Public Property IsActive As Boolean
        Get
            Return isActiveValue
        End Get
        Set(value As Boolean)
            isActiveValue = value
        End Set
    End Property

End Class
