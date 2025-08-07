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
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * .35,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              meals.strMealThumb,
              height: 120,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * .30,
                  child: Text(
                    meals.strMeal,
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    return Expanded(
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addProductToCart(meals);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added to Cart")));
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
