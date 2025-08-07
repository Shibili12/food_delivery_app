// To parse this JSON data, do
//
//     final mealsmodel = mealsmodelFromJson(jsonString);

import 'dart:convert';

Mealsmodel mealsmodelFromJson(String str) => Mealsmodel.fromJson(json.decode(str));

String mealsmodelToJson(Mealsmodel data) => json.encode(data.toJson());

class Mealsmodel {
    List<Meal> meals;

    Mealsmodel({
        required this.meals,
    });

    factory Mealsmodel.fromJson(Map<String, dynamic> json) => Mealsmodel(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
    };
}

class Meal {
    String strMeal;
    String strMealThumb;
    String idMeal;

    Meal({
        required this.strMeal,
        required this.strMealThumb,
        required this.idMeal,
    });

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
    );

    Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
    };
}
