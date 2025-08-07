 import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/model/meals_model.dart';

class CartItem {
      final Meal meal;
      int quantity;

      CartItem({required this.meal, this.quantity = 1});
    }