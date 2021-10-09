import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/screens/searchPage/search_page.dart';
import 'package:movies/styles/theme.dart';
import 'package:provider/provider.dart';

import 'models/movies.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      home: ChangeNotifierProvider(
        create: (context) => Movies(),
        child: SearchPage(),
      ),
    );
  }
}
