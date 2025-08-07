import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/meal_provider.dart';
import 'package:food_delivery_app/view/cartpage.dart';
import 'package:food_delivery_app/view/widget/meals_card.dart';
import 'package:provider/provider.dart';

class Mealspage extends StatefulWidget {
  String categoryname;
  Mealspage({super.key, required this.categoryname});

  @override
  State<Mealspage> createState() => _MealspageState();
}

class _MealspageState extends State<Mealspage> {
  @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false)
        .loadProducts(widget.categoryname);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Today Meals"),
        actions: [
          
           IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cartpage()));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Consumer<MealProvider>(builder: (context, mealsprovider, child) {
        if (mealsprovider.isLoading) {
          return CircularProgressIndicator();
        } else if (mealsprovider.meals.isEmpty) {
          return Center(
            child: Text("No meals"),
          );
        } else {
          final meal = mealsprovider.meals;
          return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: meal.length,
              itemBuilder: (context, index) {
                return MealsCard(meals: meal[index].meals[index]);
              });
        }
      }),
    );
  }
}
