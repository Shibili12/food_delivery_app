import 'dart:convert';

import 'package:food_delivery_app/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<Categorymodel>> getcategories() async {
    final url =
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((e) => Categorymodel.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}
