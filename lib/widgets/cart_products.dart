import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "IndiaGate Rice",
      "picture": "images/indiagate.jpg",
      "price": 450,
      "quantity": 1,
    },
    {
      "name": "Masala Maggi ",
      "picture": "images/maggi.jpg",
      "price": 12,
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  @override
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_qty});

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Card(
          //=============LEADING SECTION===================
          child: ListTile(
            leading: new Image.asset(
              cart_prod_picture,
              width: 80.0,
              height: 80.0,
            ),
            title: new Text(
              cart_prod_name,
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: new Column(
              children: <Widget>[
                // =====row inside column=========
                new Row(
                  children: <Widget>[
                    // ==========quantity of product============
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: new Text("Quantity : "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new Text(
                        "$cart_prod_qty",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),

                //  ==================Product price section======================
                new Container(
                    alignment: Alignment.topLeft,
                    child: new Text(
                      "₹ ${cart_prod_price} ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.red),
                    ))
              ],
            ),
            /* trailing: new Column(
              children: <Widget>[
                new IconButton(
                    icon: Icon(
                      Icons.remove,
                    ),
                    onPressed: null),
                new Text(
                  "1",
                ),
                new IconButton(icon: Icon(Icons.add), onPressed: null),
              ],
            ),*/
          ),
        ),
      ),
    );
  }
}
