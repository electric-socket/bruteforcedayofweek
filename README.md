# Brute force day of the week

After about the third or fourth time <s>you've</s> <i>I've</i> tried to write a (or modify someone else's) formula to compute Zeller's Congruence to 
calculate the day of the week, and it's wrong every time, <s>you</s> I get the impression that maybe <s>you</s> I need a stupid, simple method to produce the day of the week. So, I wrote one. And before too long I'll have more to add here. Since I want them to be simple and easy to understand, I wrote them in Basic, specifically QB64 Phoenix Edition.

Here they are:
1. BruteForceDayoftheWeek.bas - Friday, October 4 2024 - Starts with Wednesday, January 1, 1800, and just adds 1 for each day, when it gets to the end of the week, it starts over, and continues until 12/31/9999. As I mention in the program, on a 3.2ghz computer it takes 0.77 seconds. Since it saves all the days it computes, this produces 8200 *365.25 days, or about 2.994 million days. This complies fully with the "Iron Triangle Rule" of problem solutions: "Quick, easy, cheap; pick any two." Triially easy, quick to do, but expensive on memory.
2. BruteForce2.bas - Friday, October 4 2024 - Does something similar to above, but only collects the days of the week for the year it is run. It still goes all the way back to 1-1-1800 and carries the days counted forward without storing them.
3. GetYearDay.bas - Friday, October 4 2024 - Creates DayTable.bas, a set of data statements containing the day of the week for January 1 1800 to 9999.
4. Daytable.bas - Friday, October 4 2024 - The table created by GetYearDay.bas
5. GetYearandLeapDay.bas - Friday, October 4 2024 - Similar to GetYearDay.bas, creates DayandLeapTable.bas, the table of January 1 for 1800-9999 only leap years have 10 added


# Checksum Values
SHA256 hash of BruteForceDate.bas (10/04/2024  10:27 AM):
1194f4f9f893935eb3167f07ae27d75c9bc950b2a14fb0f13051ad922f4ce6ee

SHA256 hash of BruteForceDate.exe (10/04/2024  10:08 AM):
70deee84d9da339d9d789a550ea013e675d4a689d7d1a3a00a6347b53300f05f

SHA256 hash of BruteForce2.bas:
e89840228057d34ad1d6b37ab53abf30344f8e0083fa7ba6b33dfb9bb0e700e4

SHA256 hash of BruteForce2.exe:
46325a0ba8c12f66ee65784a077f10a7a033e8924ecb48c9ed373a7e9e5497c3

SHA256 hash of GetYearDay.bas:
60aba5d6ca954b01fdb2616ca1eab6dad4f1e3e8fc0d4bf1d5182e93b44681bb

SHA256 hash of GetYearDay.exe:
05ed50d47b313c07f8b28f6c37f0ea10665dfa1a36afefa7fc03d7fb10a97b30

SHA256 hash of Daytable.bas:
98413e1e796ef136a3c47268cecba20e597473a5607e9c6760b9f6f980fc3000

Paul Robinson
