import 'package:checkcheckcheck/BarNavigate/BarNavigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:checkcheckcheck/User/user_page.dart';

class Loginuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 150, 22, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                  "assets/images/OIP-removebg.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 0),
              Text(
                "BANGKOK UNITRADE",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // Sign out from previous session
                    await FirebaseAuth.instance.signOut();

                    // Sign in with Google
                    GoogleSignInAccount? googleSignInAccount =
                        await GoogleSignIn().signIn();
                    
                    // Check if sign in was successful
                    if (googleSignInAccount != null) {
                      // Navigate to user page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarNavigate(
                            user: googleSignInAccount, // Pass user data if needed
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(156, 7, 32, 60),
                    backgroundColor: Color.fromRGBO(147, 198, 229, 0.957),
                    padding:
                        EdgeInsets.symmetric(vertical: 0), // Set button size
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Set border radius
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SIGN IN WITH"),
                      SizedBox(width: 0),
                      Image.asset(
                        "assets/images/clipart.png",
                        width: 110,
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class UserPage extends StatelessWidget {
  final GoogleSignInAccount user;

  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // เมื่อเข้าสู่ระบบสำเร็จ ให้เปลี่ยนหน้าและลบหน้าปัจจุบันออกจาก stack
    return FutureBuilder(
      future: Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BarNavigate(user: user),
        ),
      ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // ยังไม่ได้คืนค่าอะไรกลับมาจาก Navigator
        return Container(); // สามารถแสดงหน้า loading ได้ที่นี่
      },
    );
  }
}
