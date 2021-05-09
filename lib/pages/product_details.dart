//import 'dart:html';
import 'dart:ui';

import 'package:demo_app/model/product.dart';
import 'package:demo_app/provider/app.dart';
import 'package:demo_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/provider/user.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
      appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.deepOrange,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              "  ",
              style: TextStyle(color: Colors.white),
            )),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 400.0,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: widget.product.picture,
                          fit: BoxFit.cover,
                          height: 380,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              footer: new Container(
                color: Colors.white54,
                child: ListTile(
                  leading: new Text(
                    widget.product.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "   ₹ ${widget.product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      new IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.deepOrange,
                            size: 30.0,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Divider(
            color: Colors.grey,
            thickness: 0.8,
          ),

          SizedBox(
            height: 1.0,
          ),

          new ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.0, 5.0, 8.0),
              child: new Text(
                "About this item ",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //new Text("Net weight : ${widget.product.weight}"),
                new Text(
                  "${widget.product.description}",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),

          Divider(
            color: Colors.grey,
            thickness: 0.8,
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Details  ",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 2.0, 5.0, 0.0),
                child: new Text(
                  "Product Name :",
                  style: TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: new Text(
                  "${widget.product.name}",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 5.0, 0.0),
                child: new Text(
                  "Net Weight  :",
                  style: TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
              ),
              // create product brand
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(
                  "${widget.product.weight}",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          // add location of product

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 5.0, 0.0),
                child: Row(
                  children: <Widget>[
                    new Text(
                      "Product Location :",
                      style: TextStyle(color: Colors.grey, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(
                  "Aisle ${widget.product.location}",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 5.0,
          ),

          Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //===============the add to cart button===========
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.deepOrange,
                    child: MaterialButton(
                      height: 45.0,
                      onPressed: () {
                        _key.currentState.showSnackBar(
                            SnackBar(content: Text("Added to Cart!")));
                      },
                      /*async {
                        appProvider.changeIsLoading();
                        bool success = await userProvider.addToCart(
                          product: widget.product,
                        );
                        if (success) {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("Added to Cart!")));
                          userProvider.reloadUserModel();
                          appProvider.changeIsLoading();
                          return;
                        } else {
                          _key.currentState.showSnackBar(
                              SnackBar(content: Text("Not added to Cart!")));
                          appProvider.changeIsLoading();
                          return;
                        }
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      child: appProvider.isLoading
                          ? Loading()
                          : Text(
                              "Add to cart",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),*/
                      elevation: 0.3,
                      child: new Text(
                        "Add to Cart  ",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              /* new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.orange[600],
                    size: 40.0,
                  ),
                  onPressed: () {}),*/
            ],
          ),
        ],
      ),
    );
  }
}
