import 'package:cocktails/model/cocktail_model.dart';
import 'package:cocktails/widgets/custom_text_container.dart';
import 'package:cocktails/widgets/large_text.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final CocktailModel coctail;
  const DetailsScreen({Key? key, required this.coctail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      coctail.ingredient1,
      coctail.ingredient2,
      coctail.ingredient3,
      coctail.ingredient4,
      coctail.ingredient5,
      coctail.ingredient6,
      coctail.ingredient7,
      coctail.ingredient8,
      coctail.ingredient9,
      coctail.ingredient10,
    ];

    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                coctail.pictureUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: LargeText(
              text: coctail.name,
              color: Colors.white,
              size: 30,
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: list
                      .map((e) => e.isNotEmpty
                          ? CustomTextContainer(text: e)
                          : Container())
                      .toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
                _sectionWraper("Category:", coctail.category),
                _sectionWraper("Alcoholic:", coctail.alcoholic),
                _sectionWraper("Glass:", coctail.glassType),
                _sectionWraper("Instructions:", coctail.instructions),
              ],
            ),
          ))
        ],
      )),
    );
  }

  _sectionWraper(String title, String content) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LargeText(
            text: title,
          ),
          const SizedBox(
            height: 5,
          ),
          LargeText(
            size: 16,
            text: content,
            color: const Color.fromARGB(255, 171, 171, 173),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      );
}
