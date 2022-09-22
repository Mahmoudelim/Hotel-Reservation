import 'package:flutter/material.dart';
import 'package:hotel_reservation/BookingScreen.dart';

import 'Home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the  of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Castaway Resort',
      theme: ThemeData(
        fontFamily: 'paco',
        primarySwatch: Colors.cyan,
      ),
      home: Home(),
      routes: {
        '0':(context)=> Home(),
        '1':(context)=> Booking()

      },
    );
  }
}


