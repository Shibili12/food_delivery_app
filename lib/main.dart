import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_provider.dart';
import 'package:food_delivery_app/controller/category_provider.dart';
import 'package:food_delivery_app/controller/meal_provider.dart';
import 'package:food_delivery_app/view/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CategoryProvider()),
        ChangeNotifierProvider(create: (_)=>MealProvider()),
        ChangeNotifierProvider(create: (_)=>CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          useMaterial3: false,
        ),
       home: Homepage(),
      ),
    );
  }
}

