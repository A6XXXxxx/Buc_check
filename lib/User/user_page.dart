import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:checkcheckcheck/Login/Loginpage.dart';


class user_page extends StatelessWidget {
  final GoogleSignInAccount user;

  user_page({required this.user, required void Function() onLogout});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            title: Text(
              'INFORMATION',
              style: GoogleFonts.viga(
                color: Color.fromARGB(210, 32, 98, 138), 
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            centerTitle: true, 
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.supervised_user_circle,
                      size: 125,
                      color: Color.fromARGB(255, 145, 178, 199),
                    ),
                    SizedBox(height: 10),
                    Info(
                      ['นางสาวแสนดี ใจดี', 'ติดต่อ: 012-3456789', 'แผนก: ดูแลสินค้า']
                    ),
                  ],
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                // Navigate back to login page
                Navigator.pop(context);
              },
              icon: Icon(Icons.exit_to_app_rounded, color: Color.fromRGBO(35, 102, 144, 20)),
              label: Text(
                'ออกจากระบบ',
                style: GoogleFonts.mali(
                  color: Color.fromRGBO(35, 102, 144, 20), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final List<String> data;

  Info(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) {
        return Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(232, 218, 231, 239),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              item,
              style: GoogleFonts.mali(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}