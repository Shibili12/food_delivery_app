import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/meals_model.dart';
import 'package:food_delivery_app/service/meals_service.dart';

class MealProvider extends ChangeNotifier{
  List<Mealsmodel> _meals = [];
  bool _isLoading = false;
  List<Mealsmodel> get meals => _meals;
  bool get isLoading => _isLoading;
  Future<void> loadProducts(String categoryname) async {
        _isLoading = true;
        notifyListeners();
        try {
          _meals = await MealsService().getMeals(categoryname);
        } catch (e) {
          print('Error loading products: $e');
        } finally {
          _isLoading = false;
          notifyListeners();
        }
      }
}