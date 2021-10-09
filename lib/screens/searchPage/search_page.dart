import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/data/post_api.dart';
import 'package:movies/models/movies.dart';
import 'package:movies/screens/searchPage/widget/search_bar.dart';
import 'package:movies/screens/searchPage/widget/search_results.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _debouncer = Debouncer(milliseconds: 1000);
  List<MovieDetails> searchResults = [];

  TextEditingController searchController = TextEditingController();
  void onSearchChange(String s) {
    if (s.length < 3) return;
    _debouncer.run(() async {
      Provider.of<Movies>(context, listen: false).setLoader(true);
      List<MovieDetails> movies = await getMovies(s);
      Provider.of<Movies>(context, listen: false).replace(movies);
      Provider.of<Movies>(context, listen: false).setLoader(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Constants.screenWidth = MediaQuery.of(context).size.width;
    Constants.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/bg bloop.png"))),
            child: Column(
              children: [
                SearchBar(
                  onSearchCallBack: onSearchChange,
                  searchController: searchController,
                ),
                _loadingSearch(),
                SearchResults()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer<Movies> _loadingSearch() {
    return Consumer<Movies>(
      builder: (context, value, child) {
        if (value.loading) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 2, 0, 2),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: 10),
                Text("Loading data...")
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
