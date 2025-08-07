import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_provider.dart';
import 'package:food_delivery_app/model/cart_model.dart';
import 'package:food_delivery_app/view/homepage.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.keyboard_arrow_left, color: Colors.black)),
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Homepage()));
              },
              icon: Icon(Icons.home, color: Colors.black))
        ],
      ),
      body: ListView.builder(
          itemCount: cartProvider.cartItems.length,
          itemBuilder: (context, index) {
            if (cartProvider.cartItems.isEmpty) {
              return Text("No Carts");
            } else {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        cartProvider.cartItems[index].meal.strMealThumb),
                  ),
                  title: Text(cartProvider.cartItems[index].meal.strMeal),
                  subtitle:
                      Text("Qty : ${cartProvider.cartItems[index].quantity}"),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .updateCartItemQuantity(
                                    cartProvider.cartItems[index].meal,
                                    cartProvider.cartItems[index].quantity + 1);
                            //           ScaffoldMessenger.of(context).showSnackBar(
                            // SnackBar(content: Text("Added to Cart")));
                          },
                          child: Icon(Icons.add)),
                      GestureDetector(
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeProductFromCart(
                              cartProvider.cartItems[index].meal,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("deleted item")));
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
