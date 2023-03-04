import 'dart:convert';
import 'package:flutterdemo/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', "/feeds/list", {"limit": "24", "start": "0"});
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "51aed905bbmsha26e4ba2fad5454p111195jsn6ddf63470a71",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipesfromSnapshot(temp);
  }
}
