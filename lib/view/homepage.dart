import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/category_provider.dart';
import 'package:food_delivery_app/view/cartpage.dart';
import 'package:food_delivery_app/view/widget/category_card.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cartpage()));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Consumer<CategoryProvider>(
          builder: (context, categoryprovider, child) {
        if (categoryprovider.isLoading) {
          return CircularProgressIndicator();
        } else if (categoryprovider.categories.isEmpty) {
          return Center(
            child: Text("No categories"),
          );
        } else {
          final cat = categoryprovider.categories;
          return ListView.builder(
              itemCount: cat.length,
              itemBuilder: (context, index) {
                return CategoryCard(category: cat[index].categories[index]);
              });
        }
      }),
    );
  }
}
