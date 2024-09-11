import 'package:emobile_vault/controller/home_controller.dart';
import 'package:emobile_vault/pages/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(), // Use existing controller instance
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Mobile Vault"),
          ),
          body: ctrl.products.isEmpty
              ? const Center(child: Text('No products available'))
              : ListView.builder(
                  itemCount: ctrl.products.length,
                  itemBuilder: (context, index) {
                    final product = ctrl.products[index];
                    return ListTile(
                      title: Text(product.name ?? 'Unnamed Product'),
                      subtitle: Text('\$${product.price ?? '0.00'}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Handle delete action
                          ctrl.productCollection
                              .doc(product.id)
                              .delete()
                              .then((_) {
                            Get.snackbar(
                                'Success', 'Product deleted successfully',
                                colorText: Colors.green);
                            ctrl.fetchProducts(); // Refresh the product list
                          }).catchError((error) {
                            Get.snackbar(
                                'Error', 'Failed to delete product: $error',
                                colorText: Colors.red);
                          });
                        },
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const AddProduct());
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
