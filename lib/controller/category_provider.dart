import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/service/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Categorymodel> _categories = [];
  bool _isLoading = false;
  List<Categorymodel> get categories => _categories;
  bool get isLoading => _isLoading;
  Future<void> loadCategory() async {
        _isLoading = true;
        notifyListeners();
        try {
          _categories = await CategoryService().getcategories();
        } catch (e) {
          print('Error loading products: $e');
        } finally {
          _isLoading = false;
          notifyListeners();
        }
      }
}
