import 'dart:convert';

import 'package:cocktails/model/cocktail_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a";
  Future<List<CocktailModel>> getList() async {
    http.Response res = await http.get(Uri.parse(baseUrl));

    List<dynamic> list = json.decode(res.body)['drinks'];

    return list.map((e) => CocktailModel.fromJson(e)).toList();
  }
}
