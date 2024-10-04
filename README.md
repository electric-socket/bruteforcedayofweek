# Brute force day of the week

After about the third or fourth time <s>you've</s> <i>I've</i> tried to write a (or modify someone else's) formula to compute Zeller's Congruence to 
calculate the day of the week, and it's wrong every time, <s>you</s> I get the impression that maybe <s>you</s> I need a stupid, simple method to produce the day of the week. So, 
I wrote one. And before too long I'll have more to add here. Since I want them to be simple and easy to understand, I wrote them in Basic, specifically QB64 Phoenix Edition.

Here they are:
1. BruteForceDayoftheWeek.bas - Friday, October 4 2024 - Starts with Wednesday, January 1, 1800, and just adds 1 for each day, when it gets to the end of the week, it starts over, and continues until 12/31/9999. As I mention in the program, on a 3.2ghz computer it takes 0.77 seconds. Since it saves all the days it computes, this produces 8200 *365.25 days, or about 2.994 million days. This complies fully with the "Iron Triangle Rule" of problem solutions: "Quick, easy, cheap; pick any two." Triially easy, quick to do, but expensive on memory.
2. (Coming Soon)

Paul Robinson
