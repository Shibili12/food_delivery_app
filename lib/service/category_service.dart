import 'dart:convert';

import 'package:food_delivery_app/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  getcategories() async {
    final url =
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      // Parse only the list under "categories"
      List<Category> categories = List<Category>.from(
        jsonResponse["categories"].map((x) => Category.fromJson(x)),
      );

      return categories;
    } else {
      throw Exception("Failed to load categories");
    }
  }
}
