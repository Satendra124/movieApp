import 'dart:convert';

import 'package:movies/models/movies.dart';
import 'package:http/http.dart';

String BASE_URL = "http://www.omdbapi.com/?apikey=a7a8a810";

Future<List<MovieDetails>> getMovies(String query) async {
  String url = BASE_URL + "&s=$query";
  Uri uri = Uri.parse(url);
  Response response = await get(uri);
  List<MovieDetails> movies = [];
  Map<String, dynamic> resultJson = jsonDecode(response.body);
  if (resultJson['Response'] == 'False') return [];
  for (Map<String, dynamic> movieJson in resultJson['Search']) {
    movies.add(await movieDetail(movieJson['imdbID']));
  }
  return movies;
}

Future<MovieDetails> movieDetail(String id) async {
  String url = BASE_URL + "&i=$id";
  Uri uri = Uri.parse(url);
  Response response = await get(uri);
  Map<String, dynamic> resultJson = jsonDecode(response.body);
  MovieDetails movies = MovieDetails.fromJson(resultJson);
  return movies;
}
