import 'package:flutter/material.dart';

// Define a model for your products
class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  // Static list of products
  static final List<Product> products = [
    Product(
      id: 1,
      name: "North Rock Saftey",
      price: 5600,
      imageUrl:
          "https://th.bing.com/th/id/OIP.7TjzJBmbJzqueqN2nGXwOgHaIn?w=254&h=213&c=7&r=0&o=5&pid=1.7",
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  product.imageUrl, // Image loaded from the internet
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                product.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Add to cart functionality here
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
