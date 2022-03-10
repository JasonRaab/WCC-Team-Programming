Public Class User

    Private UserIDValue As Integer
    Private FirstNameValue As String
    Private LastNameValue As String

    Public Property UserID() As Integer
        Get
            Return UserIDValue
        End Get
        Set(value As Integer)
            UserIDValue = value
        End Set
    End Property

    Public Property FirstName() As String
        Get
            Return FirstNameValue
        End Get
        Set(value As String)
            FirstNameValue = value
        End Set
    End Property

    Public Property LastName() As String
        Get
            Return LastNameValue
        End Get
        Set(value As String)
            LastNameValue = value
        End Set
    End Property

    Public Sub New(UserID As Integer, FirstName As String, LastName As String)
        Me.UserID = UserID
        Me.FirstName = FirstName
        Me.LastName = LastName
    End Sub

    Public Sub New(user As User)
        'Copy constructor
        Me.UserID = user.UserID
        Me.FirstName = user.FirstName
        Me.LastName = user.LastName
    End Sub

    Public Sub New()

    End Sub
End Class
