import 'package:cocktails/model/cocktail_model.dart';
import 'package:cocktails/widgets/large_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final CocktailModel cocktail;
  const CustomCard({Key? key, required this.cocktail, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        height: 220,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(cocktail.pictureUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(60),
        padding: const EdgeInsets.all(10),
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            LargeText(
              text: cocktail.category + index.toString(),
              size: 30,
            ),
            LargeText(
              text: cocktail.name,
              size: 24,
            ),
            const Icon(
              Icons.arrow_forward,
              size: 30,
            )
          ],
        ),
      )
    ]);
  }
}
