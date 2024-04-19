import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:checkcheckcheck/Home/Allproduct.dart';
import 'package:checkcheckcheck/Home/CheckPage.dart';

class Homepage extends StatelessWidget {
  List<Map<String, dynamic>> allProducts = [
    {'name': 'ULTRACOT 25X25MM', 'code': 'UNS2525', 'reference': 'UNS2206162525', 'expirationDate': '2024-05-30', 'quantity': '10'},
    {'name': 'ULTRACOT 12X40MM', 'code': 'UNS1240', 'reference': 'UNS2206161240', 'expirationDate': '2024-09-13', 'quantity': '4'},
    {'name': 'ULTRACOT 12X12MM', 'code': 'UNS1245', 'reference': 'UNS2206161249', 'expirationDate': '2024-07-05', 'quantity': '7'},
    {'name': 'ULTRACOT 6X6MM', 'code': 'UNS1278', 'reference': 'UNS2206161389', 'expirationDate': '2024-05-10', 'quantity': '9'},
    {'name': 'ULTRACOT 10X10MM', 'code': 'UNS1258', 'reference': 'UNS2206161862', 'expirationDate': '2024-12-30', 'quantity': '1'},
    {'name': 'ULTRACOT 15X15MM', 'code': 'UNS1295', 'reference': 'UNS2206161254', 'expirationDate': '2024-08-20', 'quantity': '10'},
    {'name': 'ULTRACOT 18X10MM', 'code': 'UNS1255', 'reference': 'UNS2206161866', 'expirationDate': '2024-10-13', 'quantity': '25'},
    {'name': 'ULTRACOT 15X19MM', 'code': 'UNS1299', 'reference': 'UNS2206161255', 'expirationDate': '2024-08-15', 'quantity': '8'}
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'PRODUCT',
            style: GoogleFonts.viga(
              color: Color.fromARGB(210, 32, 98, 138),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'All Product'),
              Tab(text: 'Check'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Allproduct(), // Include the Allproduct widget directly
            CheckPage(items: allProducts),
          ],
        ),
      ),
    );
  }
}
