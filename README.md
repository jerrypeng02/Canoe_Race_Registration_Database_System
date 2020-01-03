# Canoe_Race_Registration_Database_System

**A Java application that interacts with the database system designed from ER Diagram**

The ER diagram is shown [here](https://github.com/jerrypeng02/Canoe_Race_Registration_Database_System/blob/master/racelog-milestone3-diagram.png).

---

## Current Situation

- Currently Noah Participates in an Outrigger Canoeing club and various canoeing competitions which host race events for other clubs in the region.
- Each competition has many clubs and individual participants, filed into many divisions, classes and even different courses depending on the race.
- Participation is linked between the individual, the club they belong to and which canoe(s) they will be using for which events.
- Canoes can hold between 1 and 6 paddlers and a given canoe can be used by multiple different paddlers/groups of paddlers for a variety of different race division, class, and course combinations. 

---

## Problems with Status Quo

- Tedious manual entry spanned across multiple excel sheets and files.
- Data is duplicated many times and is often in non standard formats as it was manually entered.
- Requires many people just to maintain the records on the day of the race to associate the correct time to the correct event and participants.
- After the race, results are not immediately available as data must be collected and combined from several sheets to give final results

---

## Further Expanability

Web Interface: Allow multiple clubs to use the database without lugging around a specific dedicated piece of hardware (laptop) with the database on it. 

Expand applicability: This project could be generalized to work with any racing format. With very minimal changes to the actual back end, this could be used for foot, bicycle or automotive racing. Any races with a class/division system.

Automatic input of times: Many race timing devices support digital output of times. This functionality could be hooked into the database via additional java coding to automatically record times. Combine with a homebrew vision/QR code system to handle correctly assigning times to multiple competing participants.

