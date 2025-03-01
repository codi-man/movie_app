import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movies_model.dart';

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(Uri.parse('https://freetestapi.com/api/v1/movies'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    
    // Map to a list of movie
    return List.generate(jsonResponse.length, (index) {
      return Movie.fromJson(
        jsonResponse[index],
        posterUrls[index],
        storylines[index],
        List<String>.from(movieDetails[index]['cast']),
        movieDetails[index]['imdbRating'],
        movieDetails[index]['initialRelease'],
      );
    });
  } else {
    throw Exception('Failed to load movies');
  }
}