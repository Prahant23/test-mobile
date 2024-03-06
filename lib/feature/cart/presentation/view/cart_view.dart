// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vintuff_thrift/feature/cart/presentation/view_model/cart_view_model.dart';

// class CartView extends ConsumerStatefulWidget {
//   const CartView({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
// }

// class _CartViewState extends ConsumerState<CartView> {
//   @override
//   Widget build(BuildContext context) {
//     final cartState = ref.watch(cartViewModelProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cartState.cartApiModel.length,
//         itemBuilder: (BuildContext context, int index) {
//           final comment = cartState.cartApiModel[index];
//           return ListTile(
//             title: Text(comment.productId.toString()),
//             subtitle: Text('Price: ${comment.quantity}'),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Perform action when FAB is pressed, such as checkout
//         },
//         child: Icon(Icons.shopping_cart),
//       ),
//     );
//   }
// }
