import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/rendering/box.dart';
import 'iteminfo.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<String>> item = [
  ['ULTRACOT 25X25MM', 'UNS2525', 'UNS2206162525', '2024-05-30', '10'],
  ['ULTRACOT 12X40MM', 'UNS1240', 'UNS2206161240', '2024-09-13', '4'],
  ['ULTRACOT 12X12MM', 'UNS1245', 'UNS2206161249', '2024-07-05', '7'],
  ['ULTRACOT 6X6MM', 'UNS1278', 'UNS2206161389', '2024-05-10', '9'],
  ['ULTRACOT 10X10MM', 'UNS1258', 'UNS2206161862', '2024-12-30', '1'],
  ['ULTRACOT 15X15MM', 'UNS1295', 'UNS2206161254', '2024-08-20', '10'],
  ['ULTRACOT 18X10MM', 'UNS1255', 'UNS2206161866', '2024-10-13', '25'],
  ['ULTRACOT 15X19MM', 'UNS1299', 'UNS2206161255', '2024-08-15', '8']
];

class Counting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'TIME LEFT BEFORE EXPIRE',
          style: GoogleFonts.viga(
            color: Color.fromARGB(210, 32, 98, 138),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: TimeLeft(item),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TimeLeft extends StatelessWidget {
  final List<List<String>> dataList;

  TimeLeft(this.dataList);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Function to get color based on months left
    Color getColorByMonthsLeft(int monthsLeft) {
      if (monthsLeft <= 1) {
        return Color.fromARGB(220, 230, 147, 147); 
      } else if (monthsLeft == 2) {
        return Color.fromARGB(255, 255, 193, 134); 
      } else if (monthsLeft == 3) {
        return Color.fromARGB(255, 252, 238, 159);
      } else if (monthsLeft == 4) {
        return Color.fromARGB(224, 179, 226, 155);
      } else {
        return Color.fromARGB(255, 129, 204, 164); 
      }
    }

    // Sort items by remaining time
    dataList.sort((a, b) {
      DateTime expireDateA = DateTime.parse(a[3]);
      DateTime expireDateB = DateTime.parse(b[3]);
      Duration differenceA = expireDateA.difference(now);
      Duration differenceB = expireDateB.difference(now);
      return differenceA.compareTo(differenceB);
    });

    // Widgets for each item
    List<Widget> itemsWidgets = [];
    List<Widget> currentMonthItems = [];
    int? previousMonthsLeft;

    for (int i = 0; i < dataList.length; i++) {
      String itemName = dataList[i][0];
      DateTime expireDate = DateTime.parse(dataList[i][3]);
      Duration difference = expireDate.difference(now);
      int daysLeft = difference.inDays;
      int remainingMonths = difference.inDays ~/ 30;

      if ((daysLeft % 30) > 15) {
        remainingMonths += 1;
      }

      if (remainingMonths <= 6) { 
        Widget itemWidget = GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemInfo(itemData: dataList[i])),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(6),
            width: 300,
            decoration: BoxDecoration(
              color: getColorByMonthsLeft(remainingMonths),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '$itemName',
                    style: GoogleFonts.mina(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0),),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Remain: $daysLeft days left',
                    style: GoogleFonts.mina(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0),),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );

        if (previousMonthsLeft != null && remainingMonths != previousMonthsLeft) {
          if (currentMonthItems.isNotEmpty) {
            itemsWidgets.add(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${previousMonthsLeft!} Months left',
                    style: GoogleFonts.jua(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0),fontWeight : FontWeight.w500),
                  ),
                  Column(
                    children: currentMonthItems,
                  ),
                ],
              ),
            );
            currentMonthItems = [];
          }
        }
        currentMonthItems.add(itemWidget);
        previousMonthsLeft = remainingMonths;
      }
    }

    if (currentMonthItems.isNotEmpty) {
      itemsWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${previousMonthsLeft!} Months left',
              style: GoogleFonts.jua(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0),fontWeight : FontWeight.w500),
            ),
            Column(
              children: currentMonthItems,
            ),
          ],
        ),
      );
    }
    
    
    return SingleChildScrollView( 
      child: Column(
        children: itemsWidgets,
      ),
    );
  }
}
