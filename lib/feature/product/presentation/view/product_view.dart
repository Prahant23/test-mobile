import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/feature/product/presentation/view_model/product_viewmodel.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: const Text('Pagination Flutter'),
        actions: [
          TextButton.icon(
            onPressed: () {
              ref.read(productViewModelProvider.notifier).resetState();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            //* Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
            if (_scrollController.position.extentAfter == 0) {
              //* Data fetch gara api bata
              ref.read(productViewModelProvider.notifier).getProduct();
            }
          }
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                controller: _scrollController,
                itemCount: state.productApiModel.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final comment = state.productApiModel[index];
                  return ListTile(
                    leading: Text(comment.id.toString()),
                    title: Text(comment.productName.toString()),
                    subtitle: Text(comment.productPrice.toString()),
                  );
                },
              ),
            ),
            // Data load huda feri progress bar dekhaune natra banda garne
            if (state.isLoading)
              const CircularProgressIndicator(color: Colors.red),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
