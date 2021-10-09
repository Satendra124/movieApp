import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/models/movies.dart';
import 'package:movies/screens/detailsPage/widget/button.dart';
import 'package:movies/screens/detailsPage/widget/rating.dart';

class MoviesDetailScreen extends StatelessWidget {
  const MoviesDetailScreen({Key? key, required this.movie}) : super(key: key);
  final MovieDetails movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                _backgroundImage(),
                _overlayGradient(context),
                _pageButton(
                    Image.asset('assets/icons/eva_arrow-ios-back-fill.png'),
                    () {
                  Navigator.pop(context);
                }),
                _pageData(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _pageData(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 350),
          _title(context),
          _genre(context),
          SizedBox(height: 20),
          _actionButtons(),
          _ratingContainer(context),
          SizedBox(height: 20),
          _statsContainer(context),
          SizedBox(height: 20),
          _detailsContainer(context),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container _ratingContainer(BuildContext context) {
    return Container(
      width: Constants.screenWidth - 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StarRating(
                rating: double.parse(movie.imdbRating) / 2,
              ),
              Text(
                movie.imdbRating,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ...(movie.ratings.map((Rating rating) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(rating.source),
                    Text(rating.rating),
                  ],
                ),
              )))
        ],
      ),
    );
  }

  Container _statsContainer(BuildContext context) {
    return Container(
      width: Constants.screenWidth - 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          _statsDataItem(
              context,
              Image.asset('assets/icons/Group 357.png', scale: 3),
              movie.releasedYear),
          _statsDataItem(context,
              Image.asset('assets/icons/Vector.png', scale: 3), movie.country),
          _statsDataItem(
              context,
              Image.asset('assets/icons/Group 356.png', scale: 3),
              movie.runTime),
          _statsDataItem(
              context,
              Image.asset('assets/icons/Group 358.png', scale: 3),
              movie.languages),
        ],
      ),
    );
  }

  Widget _statsDataItem(BuildContext context, Image image, String lable) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          image,
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              lable,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _detailsContainer(BuildContext context) {
    return Container(
      width: Constants.screenWidth - 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Plot",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10),
          Text(
            '"' + movie.plot + '"',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          Text(
            "Director",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10),
          Wrap(
            children: movie.directors.map((e) => _peopleContainer(e)).toList(),
          ),
          SizedBox(height: 20),
          Text(
            "Actors",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10),
          Wrap(
            children: movie.actors.map((e) => _peopleContainer(e)).toList(),
          ),
          SizedBox(height: 20),
          Text(
            "Writers",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10),
          Wrap(
            children: movie.writers.map((e) => _peopleContainer(e)).toList(),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _peopleContainer(String e) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(e),
        ),
      ),
    );
  }

  Padding _actionButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _pageButton(
              Image.asset(
                'assets/icons/Vector 27.png',
                scale: 3,
              ),
              () {}),
          _pageButton(
              Image.asset(
                'assets/icons/Path-1.png',
                scale: 3,
              ),
              () {}),
          _pageButton(
              Image.asset(
                'assets/icons/Path.png',
                scale: 3,
              ),
              () {}),
        ],
      ),
    );
  }

  Container _genre(BuildContext context) {
    return Container(
      width: Constants.screenWidth,
      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Text(
        movie.genre,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Container _title(BuildContext context) {
    return Container(
      width: Constants.screenWidth,
      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Text(
        movie.title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget _pageButton(Image icon, VoidCallback callback) {
    return LiteButton(
      callBack: callback,
      color: Colors.white.withOpacity(0.2),
      height: 60,
      width: 60,
      icon: icon,
    );
  }

  Container _overlayGradient(BuildContext context) {
    return Container(
      width: Constants.screenWidth,
      height: 600,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.4),
                Theme.of(context).colorScheme.primary.withOpacity(0.8),
                Theme.of(context).colorScheme.primary,
              ],
              stops: [
                0.0,
                0.4,
                1.0
              ])),
    );
  }

  Container _backgroundImage() {
    return Container(
      width: Constants.screenWidth,
      height: 600,
      child: Image.network(
        movie.posterUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
