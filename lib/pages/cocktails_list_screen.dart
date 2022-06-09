import 'dart:async';

import 'package:cocktails/cubit/cubit/cocktail_cubit.dart';
import 'package:cocktails/model/cocktail_model.dart';
import 'package:cocktails/pages/details_screen.dart';
import 'package:cocktails/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailsListScreen extends StatefulWidget {
  const CocktailsListScreen({Key? key}) : super(key: key);

  @override
  State<CocktailsListScreen> createState() => _CocktailsListScreenState();
}

class _CocktailsListScreenState extends State<CocktailsListScreen> {
  final scrollController = ScrollController();

  void scroll(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<CocktailCubit>().getData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    scroll(context);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CocktailCubit, CocktailState>(
          builder: (context, state) {
            List<CocktailModel> coctails = [];
            bool isLoading = false;
            if (state is LoadingStates && state.isFirstFetch) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadingStates) {
              coctails = state.oldList;
              isLoading = true;
            } else if (state is LoadedStates) {
              coctails = state.cocktails;
            }

            return ListView.separated(
              controller: scrollController,
              itemCount: coctails.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < coctails.length) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(coctail: coctails[index])));
                      },
                      child: coctails[index].alcoholic == "Alcoholic"
                          ? _bannerWrapper(CustomCard(
                              cocktail: coctails[index],
                              index: index,
                            ))
                          : CustomCard(
                              cocktail: coctails[index], index: index));
                } else {
                  Timer(const Duration(microseconds: 30), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.grey);
              },
            );
          },
        ),
      ),
    );
  }

  _bannerWrapper(Widget child) => Stack(
        children: [
          child,
          Positioned(
              top: 10, right: 20, child: Image.asset('assets/18_plus.png'))
        ],
      );
}
