' Brute force get day of the week for January 1 each year

' Paul Robinson - Friday, October 4, 2024

' Collect the day of the week for January 1 for each year
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
Print "Current dir "; _CWD$


Dim As Integer DayStart, I, DayCount
Dim Shared MonthDays(1, December) As Integer, MonthNames(December) As String, DayNames(Friday) As String
Dim Shared As Integer Year, Month, Day, Hour, Minute, Second, Leap
Dim As String TextLine, BackLine

Data "January",31,"February",28,"March",31,"April",30,"May",31
Data "June",30,"July",31,"August",31,"September",30
Data "October",31,"November",30,"December",31

Data "Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"

For Month = January To December: Read MonthNames(Month), MonthDays(0, Month): Next
For Month = January To December: MonthDays(1, Month) = MonthDays(0, Month): Next ' Leap years
For Day = Saturday To Friday: Read DayNames(Day): Next

MonthDays(1, February) = 29 'Adjust for leap year
Open "Daytable.bas" For Output As #1
Print "Creating DayTable.bas"
Print #1, "' Daytable.bas"
Print #1, "' Table of day of the week for January 1 each year"
Print #1, "' 0=Saturday, 1=Sunday, 2=Monday 3=Tuesday"
Print #1, "' 4=Wednesday, 5=Thursday, 6=Friday"
Print #1, "'"
Print #1, "' Years"; Str$(StartYear); "-"; LTrim$(Str$(LimitYear))
Print #1, "'"

DayCount = 0
DayStart = Wednesday ' January 1, 1800 was a Wednesday
For Year = StartYear To LimitYear

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
            If Month = January And Day = 1 Then
                If DayCount = 0 Then
                    BackLine = "  : '" + Str$(Year) + " -"
                    Print #1, "Data ";
                Else
                    Print #1, ",";
                End If
                Print #1, DayStart;
                DayCount = DayCount + 1
                If DayCount = 10 Then
                    Print #1, BackLine; Year
                    DayCount = 0
                End If
            End If
            DayStart = DayStart + 1
            If DayStart = 7 Then DayStart = 0
        Next
    Next
Next
Close
Print "File created."
