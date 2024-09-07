import 'package:emobile_vault/controller/home_controller.dart';
import 'package:emobile_vault/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Add Product"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Product Name"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: const Text("Product Name"),
                      hintText: "Enter Product Name",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Description"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: const Text("Product Description"),
                      hintText: "Enter Product Description",
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),
                  const Text("Image Url"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: const Text("Image Url"),
                      hintText: "Enter Image Url",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Product Price"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: const Text("Product Price"),
                      hintText: "Enter Product Price",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: DropDown(
                          items: ['brand1', 'brand2', 'brand3'],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: DropDown(
                          items: ['cate1', 'cate2', 'cate3'],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Center(child: Text('Offer Product')),
                  DropDown(
                    items: ['true', 'false'],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: const Text("Add Product"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
