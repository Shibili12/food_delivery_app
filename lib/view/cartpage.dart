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
  List<CartItem> cartitems = [];

  @override
  void initState() {
    cartitems = Provider.of<CartProvider>(context, listen: false).cartItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Homepage()));
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: ListView.builder(
          itemCount: cartitems.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:
                    NetworkImage(cartitems[index].meal.strMealThumb),
              ),
              title: Text(cartitems[index].meal.strMeal),
              subtitle: Text("Qty : ${cartitems[index].quantity}"),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: true)
                            .updateCartItemQuantity(cartitems[index].meal,
                                cartitems[index].quantity + 1);
                      },
                      icon: Icon(Icons.add)),
                  IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: true)
                            .removeProductFromCart(
                          cartitems[index].meal,
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            );
          }),
    );
  }
}
