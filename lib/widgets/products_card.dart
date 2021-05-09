import 'package:demo_app/model/product.dart';
import 'package:demo_app/pages/product_details.dart';
import 'package:demo_app/widgets/loading.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/basic.dart';
import 'package:transparent_image/transparent_image.dart';

/*class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "IndiaGate Rice",
      "picture": "images/indiagate.jpg",
      "old_price": 799,
      "price": 709,
    },
    {
      "name": "Masala Maggi",
      "picture": "images/maggi.jpg",
      "old_price": 10,
      "price": 8,
    },
    /*{
      "name": "Saffola oil",
      "picture": "images/saffola.jpg",
      "old_price": 689,
      "price": 628,
    },
    {
      "name": "Cornflakes",
      "picture": "images/cornfk.jpg",
      "old_price": 350,
      "price": 310,
    },
    {
      "name": "American Lays",
      "picture": "images/lays.jpg",
      "old_price": 20,
      "price": 18,
    },
    {
      "name": "Dabur Honey",
      "picture": "images/honey.jpg",
      "old_price": 399,
      "price": 350,
    },
    {
      "name": "Oreo Biscuits",
      "picture": "images/oreo.jpg",
      "old_price": 199,
      "price": 149,
    },
    {
      "name": "Dark Fantasy",
      "picture": "images/choco.jpg",
      "old_price": 199,
      "price": 149,
    },
    {
      "name": "American Lays",
      "picture": "images/lays.jpg",
      "old_price": 20,
      "price": 18,
    },
    {
      "name": "Dabur Honey",
      "picture": "images/honey.jpg",
      "old_price": 399,
      "price": 350,
    },*/
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("products"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // here passing values of product to product detials page
                  builder: (context) => new ProductDetails(
                        product_detial_name: prod_name,
                        product_detial_new_price: prod_price,
                        product_detial_old_price: prod_old_price,
                        product_detial_picture: prod_picture,
                      ))),
//===================notePad griftile old===================
              child: GridTile(
                  footer: Container(
                      height: 40.0,
                      color: Colors.white70,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            prod_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          )),
                          new Text(
                            "₹ $prod_price     ",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      )

                      /*ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "₹ $prod_price",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "₹ $prod_old_price",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.0),
                      ),
                    ),*/
                      ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}*/

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product: product)),
          );
          //changeScreen(context, ProductDetails(product : product));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(-2, -1),
                    blurRadius: 5),
              ]),
          child: Row(
            children: <Widget>[
              //_productImage(product.picture),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  /*child: Image.network(
                  product.picture,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),*/
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
                          image: product.picture,
                          fit: BoxFit.cover,
                          height: 115,
                          width: 95,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${product.name} \n',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'at Aisle : ${product.location} \n\n',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  TextSpan(
                    text: '\₹${product.price} \t',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ], style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
