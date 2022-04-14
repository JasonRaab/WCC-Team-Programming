Imports System.Collections.ObjectModel
Imports System.ComponentModel

Public Class Order
    Implements INotifyPropertyChanged
    Public Event PropertyChanged As PropertyChangedEventHandler Implements INotifyPropertyChanged.PropertyChanged

    Public Overridable Sub OnPropertyChanged(ByVal propertyName As String)
        RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
    End Sub

    Private orderIdValue As Integer
    Private lstItemsValue As New List(Of Item)
    Private subTotalValue As Decimal
    Private taxValue As Decimal
    Private totalValue As Decimal
    Private locationValue As String
    Private isOpenValue As Integer
    Private orderDateValue As String
    Private userIdValue As Integer
    Private orderTypeValue As String

    Public Sub New()

    End Sub

    Public Sub New(Location As String)
        Me.Location = Location
    End Sub

    Public Sub New(OrderId As Integer, UserId As Integer, OrderDate As String, SubTotal As Decimal, Tax As Decimal, Total As Decimal, OrderType As String, Location As String, IsOpen As Integer, LstItems As List(Of Item))
        Me.OrderId = OrderId
        Me.UserId = UserId
        Me.OrderDate = OrderDate
        Me.SubTotal = SubTotal
        Me.Tax = Tax
        Me.Total = Total
        Me.OrderType = OrderType
        Me.Location = Location
        Me.IsOpen = IsOpen
        Me.LstItems = LstItems
    End Sub

    Public Property OrderId() As Integer
        Get
            Return orderIdValue
        End Get
        Set(value As Integer)
            orderIdValue = value
        End Set
    End Property
    Public Property UserId() As Integer
        Get
            Return userIdValue
        End Get
        Set(value As Integer)
            userIdValue = value
        End Set
    End Property
    Public Property IsOpen() As Integer
        Get
            Return isOpenValue
        End Get
        Set(value As Integer)
            isOpenValue = value
        End Set
    End Property
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
    Public Property OrderType() As String
        Get
            Return orderTypeValue
        End Get
        Set(value As String)
            orderTypeValue = value
        End Set
    End Property
    Public Property OrderDate() As String
        Get
            Return orderDateValue
        End Get
        Set(value As String)
            orderDateValue = value
        End Set
    End Property

End Class
