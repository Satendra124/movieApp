import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/models/movies.dart';
import 'package:movies/screens/detailsPage/movie_details.dart';
import 'package:provider/provider.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: Consumer<Movies>(
        builder: (context, value, child) {
          return ListView(
            //physics: NeverScrollableScrollPhysics(),
            children: value.movies.map((e) => MovieCard(movie: e)).toList(),
          );
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final MovieDetails movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          //print(movie.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoviesDetailScreen(movie: movie)));
        },
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  _movieCardImage(),
                  _movieCardRating(),
                ],
              ),
              _title(),
              _runtime(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _runtime(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Container(
          child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Image.asset(
              'assets/icons/Group 356.png',
              scale: 4,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              movie.runTime,
              style: TextStyle(
                  fontSize: 15, color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      )),
    );
  }

  Padding _title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
      child: Container(
          child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          movie.title,
          style: TextStyle(fontSize: 20),
        ),
      )),
    );
  }

  Padding _movieCardRating() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              movie.imdbRating,
            ),
          ],
        ),
      ),
    );
  }

  Container _movieCardImage() {
    return Container(
      height: 210,
      width: Constants.screenWidth - 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          movie.posterUrl == "N/A"
              ? "https://picsum.photos/200"
              : movie.posterUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
