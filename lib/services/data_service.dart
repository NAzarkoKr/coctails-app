import 'dart:convert';

import 'package:cocktails/model/cocktail_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php";
  Future<List<CocktailModel>> getList(dynamic page) async {
    http.Response res = await http.get(Uri.parse(baseUrl + '?f=a'));

    List<dynamic> list = json.decode(res.body)['drinks'];
    List<dynamic> newList = [];

    if (page == 1) {
      newList = list.sublist(0, 5);
    } else {
      newList = list.sublist((0 + 5 * page).toInt(),
          (5 + 5 * page < list.length ? 5 + 5 * page : list.length).toInt());
    }

    return newList.map((e) => CocktailModel.fromJson(e)).toList();
  }
}
