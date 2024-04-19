import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; 

class CheckPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  CheckPage({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['name']),
            subtitle: Text(_getCheckInCheckOutTime()), 
            trailing: Text('จำนวน: ${items[index]['quantity']}'),
          );
        },
      ),
    );
  }

  String _getCheckInCheckOutTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  }
}