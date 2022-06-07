import 'package:cocktails/cubit/cubit/cocktail_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CocktailCubit, CocktailState>(
          builder: (context, state) {
            if (state is LoadingStates) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedStates) {
              return ListView.builder(
                  itemCount: state.cocktails.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  coctail: state.cocktails[index])));
                        },
                        child: state.cocktails[index].alcoholic == "Alcoholic"
                            ? _bannerWrapper(
                                CustomCard(cocktail: state.cocktails[index]))
                            : CustomCard(cocktail: state.cocktails[index]));
                  });
            }
            return Container();
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
