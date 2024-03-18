import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartTrivia extends StatelessWidget {
  const StartTrivia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c2c2c),
      appBar: AppBar(
        title: Text('Start Trivia', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xff8eaccd),
      ),
      body: Container(

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color(0xffD7E5CA),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text('Lorem Ipsum'),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xffF9F3CC),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Text("Answer 1"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xffD2E0FB),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Text("Answer 2"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xffD7E5CA),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Text("Answer 3"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff8EACCD),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Text("Answer 4"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),

    );
  }
}