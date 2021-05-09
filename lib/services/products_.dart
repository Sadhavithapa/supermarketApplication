import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/model/product.dart';
import 'dart:async';

class ProductsService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'Products';

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> searchProducts({String productName}) {
    //code to convert first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);

    return _firestore
        .collection(collection)
        .orderBy("Name")
        .startAt([searchKey])
        .endAt([searchKey + '/uf8ff'])
        .get()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}
