import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_provider.dart';
import 'package:food_delivery_app/model/meals_model.dart';
import 'package:provider/provider.dart';

class MealsCard extends StatelessWidget {
  Meal meals;
  MealsCard({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      height: 200,
      child: Column(
        children: [
          Image.network(meals.strMealThumb, height: 120, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                meals.strMeal,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addProductToCart(meals);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
