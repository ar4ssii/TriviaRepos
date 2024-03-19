import 'dart:js';

import 'package:flutter/material.dart';
import 'package:trivia_time_app_2/StartTrivia.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xff2c2c2c),
     body: Column(
       children: [
         Container(
           padding: EdgeInsets.symmetric(vertical: 80),
           height: 200,
           width: double.maxFinite,
           decoration: BoxDecoration(
             color: Color(0xff8eaccd),
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(50),
               bottomRight: Radius.circular(50),
             ),
           ),
           child: Column(
             children: [
               Text(
                 'TriviaTime App',
                 style: TextStyle(color: Colors.white),
               ),
             ],
           ),
         ),
         Expanded(
           child: Center(
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Color(0xffd7e5ca), // Background color of the button
               ),
               child: Text('Start Trivia',style: TextStyle(color: Colors.grey[700]),),
               onPressed: () {
                 // Navigator.push(
                 //   context,
                 //   MaterialPageRoute(builder: (context) => const StartTrivia()),
                 // );
                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (BuildContext context) => StartTrivia())
                 );
               },

             ),
           ),
         ),
       ],
     ),
   );
  }
}

