Public Class Ingredient

    Private idValue As Integer
    Private nameValue As String
    Private categoryValue As String
    Private stockValue As Integer
    Private priceValue As Decimal

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
End Class
