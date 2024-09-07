import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emobile_vault/pages/add_product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  @override
  void onInit() {
    productCollection = firestore.collection('products');
    // TODO: implement onInit
    super.onInit();
  }

  AddProduct() {
    DocumentReference doc = productCollection.doc();
    
  }
}
