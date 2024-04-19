import 'package:checkcheckcheck/Home/Homepage.dart';
import 'package:checkcheckcheck/counting/counting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:checkcheckcheck/User/user_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BarNavigate extends StatefulWidget {
  final GoogleSignInAccount user; // เพิ่มพารามิเตอร์ user

  const BarNavigate({Key? key, required this.user}) : super(key: key);

  @override
  State<BarNavigate> createState() => _BarNavigateState();
}
class _BarNavigateState extends State<BarNavigate> {
  int currentIndex = 0;
  late List<Widget> func;

  @override
  void initState() {
    super.initState();
    func = [
      Homepage(),
      Counting(),
      user_page(user: widget.user, onLogout: () {  },), // ใช้ข้อมูล user ที่ถูกส่งเข้ามา
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ตรวจสอบ currentIndex ก่อนที่จะเรียกใช้ func[currentIndex]
    if (currentIndex >= func.length) {
      currentIndex = 0; // หรือจะกำหนดให้เป็นค่าอื่นก็ได้ ตามความเหมาะสม
    }

    return Scaffold(
      body: Center(child: func[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 145, 178, 199),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.white, size: 36),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_on, color: Colors.white, size: 36),
            label: 'Counting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4, color: Colors.white, size: 36),
            label: 'User',
          ),
        ],
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
