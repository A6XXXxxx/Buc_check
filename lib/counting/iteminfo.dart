import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemInfo extends StatelessWidget {
  final List<String> itemData;

  ItemInfo({required this.itemData});

  @override
  Widget build(BuildContext context) {
    // ฟังก์ชันสำหรับคำนวณและแสดงเวลาที่เหลือ
    String calculateRemainingTime(String expiryDate) {
      DateTime now = DateTime.now();
      DateTime expirationDate = DateTime.parse(expiryDate);
      Duration difference = expirationDate.difference(now);
      
      int daysLeft = difference.inDays;
      int monthsLeft = (daysLeft / 30).floor();
      
      if (daysLeft <= 0) {
        return 'Expired';
      } else {
        return '$daysLeft days';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData[0],
              style: GoogleFonts.jua(fontSize: 22, color: const Color.fromARGB(255, 0, 0, 0),fontWeight:FontWeight.w300),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 145, 178, 199),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Material No. ${itemData[1]}',
                    style: GoogleFonts.mina(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Batch : ${itemData[2]}',
                    style: GoogleFonts.mina(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Expiration Date : ${itemData[3]}',
                    style: GoogleFonts.mina(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Quantity : ${itemData[4]}',
                    style: GoogleFonts.mina(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Time Left: ${calculateRemainingTime(itemData[3])}',
                    style: GoogleFonts.mina(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            DataTable(
              columns: [
                DataColumn(label: Text('Check in')),
                DataColumn(label: Text('Check out')),
                DataColumn(label: Text('By')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Value 1')),
                  DataCell(Text('Value 2')),
                  DataCell(Text('Value 3')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Value 4')),
                  DataCell(Text('Value 5')),
                  DataCell(Text('Value 6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Value 7')),
                  DataCell(Text('Value 8')),
                  DataCell(Text('Value 9')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
