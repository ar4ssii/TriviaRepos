import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';

import 'model/RandomTrivia.dart';

class StartTrivia extends StatefulWidget {
  const StartTrivia({Key? key}) : super(key: key);

  @override
  State<StartTrivia> createState() => _StartTriviaState();
}

class _StartTriviaState extends State<StartTrivia> {
  final _getRandomTrivia = getRandomTrivia();
  RandomTrivia? _randomTrivia;
  String? question;
  int selectedCategory = 1; // Default category

  // List of categories
  final categories = {
    'Default' : 1,
    'General Knowledge': 9,
    'Music': 12,
    'Film': 11,
    'Mythology': 20,
    'Manga': 31,
  };

  // Fetch trivia based on the selected category
  _fetchTrivia(int category) async {
    try {
      final trivia = await _getRandomTrivia.getTrivia(category);
      setState(() {
        _randomTrivia = trivia;
        print("Question: ${_randomTrivia?.question}");
        print("Correct: ${_randomTrivia?.correctAnswer}");
      });
      question = HtmlUnescape().convert(_randomTrivia!.question);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _fetchTrivia(selectedCategory);
    super.initState();
  }

  void _showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(
              isCorrect ? 'Your choice is correct!' : 'Your choice is incorrect!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _fetchTrivia(selectedCategory);
                Navigator.of(context).pop();
              },
              child: Text('Retry'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c2c2c),
      appBar: AppBar(
        title: Text('Start Trivia', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff8eaccd),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Color(0xff2c2c2c),
              automaticallyImplyLeading: false, // This line removes the back button
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category:',
                    style: TextStyle(color: Colors.white),
                  ),
                  DropdownButton<int>(
                    value: selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                        _fetchTrivia(selectedCategory);
                      });
                    },
                    style: TextStyle(color: Colors.white), // Set text color of dropdown button
                    dropdownColor:Colors.black45,
                    items: categories.entries.map((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.value,
                        child: Text(
                          entry.key,
                          style: TextStyle(color: Colors.white), // Set text color of dropdown menu items
                        ),
                      );
                    }).toList(),
                  ),

                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xffD7E5CA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Question',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Question: ${question ?? "loading.."}'),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  bool isCorrect = _randomTrivia!.correctAnswer.toLowerCase() == 'true';
                  _showResultDialog(isCorrect);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF9F3CC),
                ),
                child: Text('True'),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  bool isCorrect = _randomTrivia!.correctAnswer.toLowerCase() == 'false';
                  _showResultDialog(isCorrect);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffD2E0FB),
                ),
                child: Text('False'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class getRandomTrivia {
  static const API_URL = "https://opentdb.com/api.php";

  Future<RandomTrivia> getTrivia(int category) async {
    final response = await http.get(Uri.parse('$API_URL?amount=1&type=boolean&category=$category'));
    await Future.delayed(Duration(seconds: 2));
    if (response.statusCode == 200) {
      return RandomTrivia.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data...');
    }
  }
}
