import 'dart:convert';

import 'package:food_delivery_app/model/meals_model.dart';
import 'package:http/http.dart' as http;

class MealsService {
  Future<List<Mealsmodel>> getMeals(String category) async {
    final url = Uri.parse(
        " https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => Mealsmodel.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}
