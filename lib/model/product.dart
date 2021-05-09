//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const CATEGORY = "Category";
  static const LOCATION = "Location";
  static const NAME = "Name";
  static const WEIGHT = "Netweight";
  static const PICTURE = "Picture";
  static const PRICE = "Price";
  static const FEATURED = "featured";
  static const DESCRIPTION = "Description";
  static const QUANTITY = "Quantity";
  static const ID = "id";

  //private

  String _category;
  String _location;
  String _name;
  String _weight;
  String _picture;
  int _price;
  bool _featured;
  String _description;
  int _quantity;
  String _id;

  //access private variable

  String get category => _category;
  String get location => _location;
  String get name => _name;
  String get weight => _weight;
  String get picture => _picture;
  int get price => _price;
  bool get featured => _featured;
  String get description => _description;
  int get quantity => _quantity;
  String get id => _id;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _category = snapshot.data()[CATEGORY];
    _location = snapshot.data()[LOCATION];
    _name = snapshot.data()[NAME];
    _weight = snapshot.data()[WEIGHT];
    _picture = snapshot.data()[PICTURE];
    _price = snapshot.data()[PRICE];
    _featured = snapshot.data()[FEATURED];
    _description = snapshot.data()[DESCRIPTION] ?? " ";
    _quantity = snapshot.data()[QUANTITY];
    _id = snapshot.data()[ID];
  }
}
