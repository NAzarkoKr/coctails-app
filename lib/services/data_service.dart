import 'dart:convert';

import 'package:cocktails/model/cocktail_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php";
  Future<List<CocktailModel>> getList(dynamic page) async {
    if (page == 1) {
      page = 'a';
    } else if (page == 2) {
      page = 'b';
    } else {
      page = 'c';
    }

    http.Response res = await http.get(Uri.parse(baseUrl + '?f=$page'));

    List<dynamic> list = json.decode(res.body)['drinks'];

    return list.map((e) => CocktailModel.fromJson(e)).take(5).toList();
  }
}
