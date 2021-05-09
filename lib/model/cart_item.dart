class CartItemModel {
  static const ID = "id";
  static const NAME = "Name";
  static const PICTURE = "Picture";
  //static const LOCATION = "Location";
  // static const QUANTITY = "Quantity";
  static const PRICE = "Price";
  static const WEIGHT = "Netweight";
  //static const PRODUCT_ID = "productId";

  String _id;
  String _name;
  String _picture;
  //String _productId;
  String _weight;
  //int _quantity;
  int _price;

  //  getters
  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  //String get productId => _productId;

  String get weight => _weight;

  int get price => _price;

  //int get quantity => _quantity;

  CartItemModel.fromMap(Map data) {
    _id = data[ID];
    _name = data[NAME];
    _picture = data[PICTURE];
    //_productId = data[PRODUCT_ID];
    _price = data[PRICE];
    //_quantity = data[QUANTITY];
    _weight = data[WEIGHT];
  }

  Map toMap() => {
        ID: _id,
        PICTURE: _picture,
        NAME: _name,
        //PRODUCT_ID: _productId,
        //QUANTITY: _quantity,
        PRICE: _price,
        WEIGHT: _weight,
      };
}
