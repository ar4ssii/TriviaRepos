import 'dart:convert';

import 'package:trivia_time_app_2/model/RandomTrivia.dart';
import 'package:http/http.dart' as http;

class getRandomTrivia{
  static const API_URL = "https://opentdb.com/api.php";

  Future<RandomTrivia> getTrivia(int category) async{
    final response = await http.get(
      Uri.parse('$API_URL?amount=1&type=boolean&category=$category')
    );
    await Future.delayed(Duration(seconds: 2));
    if(response.statusCode == 200){
      return RandomTrivia.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load data...');
    }

  }
}