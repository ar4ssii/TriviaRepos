import 'dart:convert';

import 'package:trivia_time_app_2/model/RandomTrivia.dart';
import 'package:http/http.dart' as http;

class GetRandomTrivia {
  static const API_URL = "https://opentdb.com/api.php";

  Future<RandomTrivia> getTrivia(int category) async {
    final apiUrl = _getApiUrl(category);
    final response = await http.get(Uri.parse(apiUrl));
    await Future.delayed(Duration(seconds: 2));
    if (response.statusCode == 200) {
      return RandomTrivia.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data...');
    }
  }

  String _getApiUrl(int category) {
    switch (category) {
      case 9:
        return '$API_URL?amount=50&category=9';
      case 12:
        return '$API_URL?amount=50&category=12';
      case 11:
        return '$API_URL?amount=50&category=11';
      case 20:
        return '$API_URL?amount=50&category=20';
      case 31:
        return '$API_URL?amount=50&category=31';
      default:
        return '$API_URL?amount=50';
    }
  }
}
