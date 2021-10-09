// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function onSearchCallBack;
  final TextEditingController searchController;
  SearchBar(
      {Key? key,
      required this.onSearchCallBack,
      required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: screenWidth - 50,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Image.asset(
                  'assets/icons/Frame.png',
                  height: 25,
                ),
              ),
              Expanded(
                  child: TextFormField(
                controller: searchController,
                cursorColor: Theme.of(context).colorScheme.secondary,
                style: Theme.of(context).textTheme.subtitle2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) => onSearchCallBack(value),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/Group 220.png',
                    height: 20,
                  ),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
