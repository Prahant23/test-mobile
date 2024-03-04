import 'package:flutter/material.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_home.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_search.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_profile.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 100,
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            'Item Added to Cart!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Continue Shopping'),
          ),
        ],
      ),
    );
  }
}
