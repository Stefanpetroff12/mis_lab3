import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Joke.dart';
import '../models/JokeType.dart';

class ApiServices {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  static Future<List<JokeType>> getJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((type) => JokeType.fromJson({'type': type})).toList();
    } else {
      throw Exception('Failed to load Joke types');
    }
  }

  static Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  static Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}