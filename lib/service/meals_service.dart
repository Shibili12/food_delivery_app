import 'dart:convert';

import 'package:food_delivery_app/model/meals_model.dart';
import 'package:http/http.dart' as http;

class MealsService {
  getMeals(String category) async {
    final url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      // Parse only the list under "categories"
      List<Meal> categories = List<Meal>.from(
        jsonResponse["meals"].map((x) => Meal.fromJson(x)),
      );

      return categories;
    } else {
      throw Exception("Failed to load categories");
    }
  }
}
