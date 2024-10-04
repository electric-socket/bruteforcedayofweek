' Brute force day of the week  #2

' Paul Robinson - Friday, October 4, 2024

' I tried doing Zeller's congruence but I kept getting the
' formula wrong, so I thought, is there a simpler method?
' Like really stupid simple? Then I thought of one.

' Instead of Zeller's Congruence, just count every day from
' Wednesday, January 1, 1800 until 12/31/9999
' On a 3.2ghz computer, it takes about 0.77 seconds

' This only collects the days of the week for this year

Option _Explicit
Const Saturday = 0
Const Sunday = Saturday + 1
Const Monday = Sunday + 1
Const Tuesday = Monday + 1
Const Wednesday = Tuesday + 1
Const Thursday = Wednesday + 1
Const Friday = Thursday + 1

Const January = 1, February = 2, March = 3, April = 4, May = 5, June = 6
Const July = 7, August = 8, September = 9, October = 10, November = 11, December = 12

Const StartYear = 1800
Const LimitYear = 9999

Dim Shared YD(December, 31) As Integer ' Last year only
Dim As Integer DayStart, I, TheYear, TheMonth, TheDay
Dim Shared MonthDays(1, December) As Integer, MonthNames(December) As String, DayNames(Friday) As String
Dim Shared As Integer Year, Month, Day, Hour, Minute, Second, Leap
Dim D$, T$, AmPm As String
D$ = Date$: T$ = Time$
TheMonth = Val(Mid$(D$, 1, 2))
TheDay = Val(Mid$(D$, 4, 2))
TheYear = Val(Mid$(D$, 7, 4))
Hour = Val(Mid$(T$, 1, 2))
Minute = Val(Mid$(T$, 4, 2))
Second = Val(Mid$(T$, 7, 2))
AmPm = "A.M"
If Hour = 0 Then Hour = 12 ' For AM
If Hour > 12 Then Hour = Hour - 12: AmPm = "P.M"


Data "January",31,"February",28,"March",31,"April",30,"May",31
Data "June",30,"July",31,"August",31,"September",30
Data "October",31,"November",30,"December",31

Data "Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"

For Month = January To December: Read MonthNames(Month), MonthDays(0, Month): Next
For Month = January To December: MonthDays(1, Month) = MonthDays(0, Month): Next ' Leap years
For Day = Saturday To Friday: Read DayNames(Day): Next

MonthDays(1, February) = 29 'Adjust for leap year

DayStart = Wednesday ' January 1, 1800 was a Wednesday
For Year = StartYear To TheYear

    LeapTest:

    Leap = 0 ' not determined if leap year; presume it is not

    '     Leap Year Calcultions

    ' Year mod 4 = 0 for a leap year (in most cases)
    If Year Mod 4 = 0 Then ' It is virtually certain it is a leap year with one exception

        ' If it is a century year (year where last two digits are 00)
        If Year Mod 100 <> 0 Then ' Not a century year
            Leap = 1 ' regular leap year
        Else ' It is a century year, it must also be divisible by 400
            If Year Mod 400 = 0 Then Leap = 1 ' Century leap year
        End If
    End If
    ' End of Leaptest

    ' Now count the days
    For Month = January To December
        For Day = 1 To MonthDays(Leap, Month) ' if leap year, uses alternate
            If Year = TheYear Then YD(Month, Day) = DayStart
            DayStart = DayStart + 1
            If DayStart = 7 Then DayStart = 0
        Next
    Next
Next

Print DayNames(YD(TheMonth, TheDay)); ", "; MonthNames(TheMonth); Str$(TheDay); ","; TheYear; "at";

' If military format is OK, just print t$
'' Use either:
' Print " ";T$
'' or
Print Str$(Hour); ":"; Right$("0" + LTrim$(Str$(Minute)), 2); ":"; Right$("0" + LTrim$(Str$(Second)), 2); " "; AmPm

