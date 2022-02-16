﻿Public Class Order

    Private lstItemsValue As New List(Of Item)
    Private subTotalValue As Decimal
    Private taxValue As Decimal
    Private totalValue As Decimal
    Private locationValue As String

    Public Sub New()

    End Sub

    Public Sub New(Location As String)
        Me.Location = Location
    End Sub

    Public Property LstItems() As List(Of Item)
        Get
            Return lstItemsValue
        End Get
        Set(value As List(Of Item))
            lstItemsValue = value
        End Set
    End Property
    Public Property SubTotal() As Decimal
        Get
            Return subTotalValue
        End Get
        Set(value As Decimal)
            subTotalValue = value
        End Set
    End Property
    Public Property Tax() As Decimal
        Get
            Return taxValue
        End Get
        Set(value As Decimal)
            taxValue = value
        End Set
    End Property
    Public Property Total() As Decimal
        Get
            Return totalValue
        End Get
        Set(value As Decimal)
            totalValue = value
        End Set
    End Property
    Public Property Location() As String
        Get
            Return locationValue
        End Get
        Set(value As String)
            locationValue = value
        End Set
    End Property

End Class
