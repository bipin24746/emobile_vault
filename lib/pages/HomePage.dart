import 'package:emobile_vault/controller/home_controller.dart';
import 'package:emobile_vault/pages/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Mobile Vault"),
          ),
          body: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text("title"),
                subtitle: const Text("price: 1500"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
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
