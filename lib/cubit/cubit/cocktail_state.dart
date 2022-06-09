part of 'cocktail_cubit.dart';

abstract class CocktailState extends Equatable {
  const CocktailState();

  @override
  List<Object> get props => [];
}

class CocktailInitial extends CocktailState {}

class LoadingStates extends CocktailState {
  final List<CocktailModel> oldList;
  final bool isFirstFetch;

  const LoadingStates(this.oldList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldList];
}

class LoadedStates extends CocktailState {
  const LoadedStates(this.cocktails);
  final List<CocktailModel> cocktails;
  @override
  List<Object> get props => [cocktails];
}
