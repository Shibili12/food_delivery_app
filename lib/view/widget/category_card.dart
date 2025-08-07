import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/view/mealspage.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Image.network(category.strCategoryThumb,
              height: 150, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.strCategory,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Mealspage(categoryname: category.strCategory)));
                  },
                  icon: Icon(Icons.arrow_circle_right_outlined))
            ],
          ),
          Text(
            category.strCategoryDescription,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
