import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emobile_vault/model/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'unbranded';
  bool offer = false;

  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();
    productCollection = firestore.collection('products');
    fetchProducts(); // Fetch products when the controller is initialized
  }

  void addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      double? price = double.tryParse(productPriceCtrl.text);

      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        description: productDescriptionCtrl.text,
        category: category,
        brand: brand,
        image: productImageCtrl.text,
        price: price,
        offer: offer,
      );

      final productJson = product.toJson();
      doc.set(productJson).then((_) {
        Get.snackbar('Success', 'Product added successfully',
            colorText: Colors.green);
        setValuesDefault();
        fetchProducts(); // Refresh the product list
      }).catchError((error) {
        Get.snackbar('Error', 'Failed to add product: $error',
            colorText: Colors.red);
      });
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      // TODO: Handle exception
    } finally {
      update();
    }
  }

  void fetchProducts() async {
    try {
      QuerySnapshot querySnapshot = await productCollection.get();
      final List<Product> retrievedProducts = querySnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.addAll(retrievedProducts);
      Get.snackbar('success', 'Products fetched successfully',
          colorText: Colors.green);
      update(); // Notify listeners of the change
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e',
          colorText: Colors.green);
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
      Get.snackbar('successfull', 'product deleted successfully',
          colorText: Colors.red);
    } catch (e) {
      print(e);
    }
  }

  void setValuesDefault() {
    productNameCtrl.clear();
    productPriceCtrl.clear();
    productImageCtrl.clear();
    productDescriptionCtrl.clear();

    category = 'general';
    brand = 'unbranded';
    offer = false;
    update();
  }
}
