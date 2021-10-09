import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  StarRating({this.starCount = 5, this.rating = .0});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).colorScheme.secondaryVariant,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
