import 'package:demo_app/services/products_.dart';
import 'package:demo_app/model/product.dart';
import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';

//==================PROVIDER===================
class ProductProvider with ChangeNotifier {
  ProductsService _productsService = ProductsService();
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

//getter

  // List<ProductModel> get featureProducts => _featureProducts;

//methods
  loadProducts() async {
    products = await _productsService.getProducts();
    notifyListeners();
  }

  Future search({String productName}) async {
    productsSearched =
        await _productsService.searchProducts(productName: productName);
    notifyListeners();
  }
}
