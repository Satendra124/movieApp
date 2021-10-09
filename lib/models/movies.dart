import 'package:flutter/material.dart';

class Movies extends ChangeNotifier {
  final List<MovieDetails> _movies = [];
  List<MovieDetails> get movies => _movies;
  bool _isLoading = false;
  bool get loading => _isLoading;
  void setLoader(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void replace(List<MovieDetails> newMovies) {
    _movies.clear();
    for (MovieDetails m in newMovies) {
      _movies.add(m);
    }
    notifyListeners();
  }
}

// class Movie {
//   String title;
//   String year;
//   String imdbId;
//   String type;
//   String posterUrl;

//   Movie(this.title, this.year, this.imdbId, this.type, this.posterUrl);
//   Movie.fromJson(Map<String, dynamic> json)
//       : title = json['Title'],
//         year = json['Year'],
//         imdbId = json['imdbID'],
//         type = json['Type'],
//         posterUrl = json['Poster'];
//   @override
//   String toString() {
//     return "Movie(Title: $title, Year: $year)";
//   }
// }

class MovieDetails {
  final String title;
  final String year;
  final String imdbId;
  final String posterUrl;
  final String releasedYear;
  final String runTime;
  final String genre;
  final String imdbRating;
  final List<Rating> ratings;
  final String country;
  final String languages;
  final String plot;
  final List<String> directors;
  final List<String> actors;
  final List<String> writers;

  MovieDetails(
      this.title,
      this.year,
      this.imdbId,
      this.releasedYear,
      this.posterUrl,
      this.runTime,
      this.genre,
      this.imdbRating,
      this.ratings,
      this.country,
      this.languages,
      this.plot,
      this.directors,
      this.actors,
      this.writers);
  MovieDetails.fromJson(Map<String, dynamic> json)
      : title = json['Title'],
        year = json['Year'],
        imdbId = json['imdbID'],
        releasedYear = json['Released'].split(" ").last,
        runTime = json['Runtime'],
        genre = json['Genre'],
        imdbRating = json['imdbRating'],
        ratings = <Rating>[
          ...(json['Ratings'].map((js) => Rating.fromJson(js)).toList())
        ],
        country = json['Country'],
        languages = json['Language'],
        plot = json['Plot'],
        directors = json['Director'].split(","),
        actors = json['Actors'].split(","),
        writers = json['Writer'].split(","),
        posterUrl = json['Poster'];
  @override
  String toString() {
    return "Movie(Title: $title)";
  }
}

class Rating {
  final String source;
  final String rating;

  Rating(this.source, this.rating);
  Rating.fromJson(Map<String, dynamic> json)
      : source = json['Source'],
        rating = json['Value'];
}
