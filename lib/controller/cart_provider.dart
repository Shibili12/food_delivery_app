 import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/cart_model.dart';
import 'package:food_delivery_app/model/meals_model.dart';


    class CartProvider extends ChangeNotifier {
      final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addProductToCart(Meal product) {
    int index = _cartItems.indexWhere((item) => item.meal.idMeal == product.idMeal);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(meal: product));
    }
    notifyListeners();
  }

  void removeProductFromCart(Meal product) {
    _cartItems.removeWhere((item) => item.meal.idMeal == product.idMeal);
    notifyListeners();
  }

  void updateCartItemQuantity(Meal product, int quantity) {
    int index = _cartItems.indexWhere((item) => item.meal.idMeal == product.idMeal);
    if (index != -1) {
      _cartItems[index].quantity = quantity;
      notifyListeners();
    }
  }
    }