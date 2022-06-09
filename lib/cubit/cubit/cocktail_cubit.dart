import 'package:bloc/bloc.dart';
import 'package:cocktails/model/cocktail_model.dart';
import 'package:cocktails/services/data_service.dart';
import 'package:equatable/equatable.dart';

part 'cocktail_state.dart';

class CocktailCubit extends Cubit<CocktailState> {
  CocktailCubit({required this.data}) : super(CocktailInitial());

  final DataService data;
  int page = 1;

  void getData() async {
    if (state is LoadingStates) return;
    final currentState = state;
    var oldList = <CocktailModel>[];
    if (currentState is LoadedStates) {
      oldList = currentState.cocktails;
    }
    emit(LoadingStates(oldList, isFirstFetch: page == 1));
    final fetchData = await data.getList(page);

    page++;
    final cocktails = (state as LoadingStates).oldList;

    cocktails.addAll(fetchData);

    emit(LoadedStates(cocktails));
  }
}
