import 'package:bloc/bloc.dart';
import 'package:cocktails/model/cocktail_model.dart';
import 'package:cocktails/services/data_service.dart';
import 'package:equatable/equatable.dart';

part 'cocktail_state.dart';

class CocktailCubit extends Cubit<CocktailState> {
  CocktailCubit({required this.data}) : super(CocktailInitial());

  final DataService data;

  void getData() async {
    final List<CocktailModel> cocktails;
    try {
      emit(LoadingStates());
      cocktails = await data.getList();
      emit(LoadedStates(cocktails));
    } catch (e) {}
  }
}
