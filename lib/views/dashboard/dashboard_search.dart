import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/feature/cart/data/model/cart_api_model.dart';
import 'package:vintuff_thrift/feature/cart/presentation/view_model/cart_view_model.dart';
import 'package:vintuff_thrift/feature/product/data/model/product_api_model.dart';
import 'package:vintuff_thrift/feature/product/presentation/view_model/product_viewmodel.dart';

class DashboardSearch extends ConsumerStatefulWidget {
  const DashboardSearch({Key? key});

  @override
  ConsumerState<DashboardSearch> createState() => _DashboardSearchState();
}

class _DashboardSearchState extends ConsumerState<DashboardSearch> {
  List<ProductApiModel> products = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(productViewModelProvider.notifier).getProduct();
      products = ref.watch(productViewModelProvider).productApiModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter product name...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (val) {
                if (val.isEmpty) {
                  products =
                      ref.watch(productViewModelProvider).productApiModel;
                  setState(() {});
                } else {
                  products = products.where((element) {
                    return element.productName!.toLowerCase().contains(val);
                  }).toList();
                  setState(() {});
                }
              },
            ),
            SizedBox(height: 16),
            // Add more UI elements for search results or filters if needed
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  product.productImage.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productName.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        'Price: ', // Add the label for the price
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$${product.productPrice.toString()}', // Display the price
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      CartApiModel cartApiModel = CartApiModel(
                                          quantity: 1, productId: product.id);
                                      ref
                                          .watch(cartViewModelProvider.notifier)
                                          .addToCart(cartApiModel, context);
                                    },
                                    child: Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
