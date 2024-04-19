import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Allproduct extends StatefulWidget {
  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
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
  List<Map<String, dynamic>> allProducts = [];

  @override
  void initState() {
    super.initState();
    allProducts = item.map((data) {
      return {
        'name': data[0],
        'code': data[1],
        'reference': data[2],
        'expirationDate': data[3],
        'quantity': data[4],
      };
    }).toList();
  }

  List<Map<String, dynamic>> filteredProducts = [];

  void searchProducts(String query) {
    setState(() {
      filteredProducts = allProducts.where((product) => product['name'].toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchProducts,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: GoogleFonts.mina(fontSize: 16, color: const Color.fromARGB(255, 10, 73, 124)), // เปลี่ยนสีเป็นสีฟ้า
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                filled: true,
                fillColor:  Color.fromARGB(255, 215, 234, 246),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // ย่อขนาดข้อความ
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ItemInfo(
                    //     itemData: {
                    //       'name': filteredProducts[index]['name'],
                    //       'code': filteredProducts[index]['code'],
                    //       'reference': filteredProducts[index]['reference'],
                    //       'expirationDate': filteredProducts[index]['expirationDate'],
                    //       'quantity': filteredProducts[index]['quantity'],
                    //     },
                    //   )),
                    // );
                  },

                  child: ListTile(
                    title: Text(
                      filteredProducts[index]['name'],
                      style: GoogleFonts.mina(color: Color.fromARGB(255, 2, 120, 216)), // กำหนดสีข้อความเป็นสีฟ้า
                    ),
                    subtitle: Text('Expiration Date: ${filteredProducts[index]['expirationDate']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
