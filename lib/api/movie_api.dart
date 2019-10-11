import 'package:http/http.dart' as http;

import 'package:flutter_bloc_basics/models/movie_model.dart';

import '../secret/keys.dart';

class MovieAPI {
  final omdbUrl = 'http://www.omdbapi.com/?apikey=$apiKey&t=';

  Future<Movie> findMovie(String name) async {
    try {
      final response = await http.get('$omdbUrl$name');
      if (response.statusCode == 200) {
        // print(response.body);
        return movieFromJson(response.body);
      } else {
        throw Exception("Error occured while fetching movie");
      }
    } catch (e) {
      print("Error occured during connection: $e");
      return null;
    }
  }
}
