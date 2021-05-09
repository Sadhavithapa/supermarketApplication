import 'package:demo_app/pages/product_search.dart';
import 'package:demo_app/provider/product.dart';
//import 'package:demo_app/widgets/search.dart';
import 'package:demo_app/pages/cart.dart';
import 'package:demo_app/pages/start.dart';
import 'package:demo_app/services/products_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:demo_app/widgets/horizontal_listview.dart';
import 'package:demo_app/widgets/products_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ProductsService _productsService = ProductsService();
  //TextEditingController _searchController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    ScrollController _controller = new ScrollController();

    Widget image_carousel = new Container(
      height: 210.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/grthre.jpg"),
          AssetImage("images/grtwo.jpg"),
          AssetImage("images/groceries.jpg"),
          AssetImage("images/back.jpeg"),
          AssetImage("images/brand_f.jpg"),
        ],
        autoplay: true,
        dotSize: 5.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 10.0,
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 2000),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
          elevation: 0.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  title: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (pattern) async {
                      await productProvider.search(productName: pattern);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductSearchScreen()));
                    },
                    decoration: InputDecoration(
                      hintText: "Search Products ",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: " Search . . . .",
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "The search field cannot be empty";
                }
                return null;
              },
            ),
          ),*/
        ),
        actions: <Widget>[
          /* new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.deepOrange,
            ),
            onPressed: () {},
          ),*/
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new Cart()));
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: !isloggedin
            ? CircularProgressIndicator()
            : new ListView(
                children: <Widget>[
                  //header
                  new UserAccountsDrawerHeader(
                    accountName: Text(
                      "${user.displayName}",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    accountEmail: Text(
                      "${user.email}",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                        /*backgroundImage:
                            NetworkImage("https://www.fillmurray.com/200/200"),
                        radius: 60.0,*/
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.deepOrange,
                    ),
                  ),
                  //body
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Home Page"),
                      leading: Icon(
                        Icons.home,
                        //color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("My Account"),
                      leading: Icon(
                        Icons.person,
                        //color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Previous Purchases"),
                      leading: Icon(
                        Icons.shopping_basket,
                        // color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => new Cart()));
                    },
                    child: ListTile(
                      title: Text("Shopping Cart"),
                      leading: Icon(
                        Icons.shopping_cart,
                        //color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Favorites"),
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),

                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Settings"),
                      leading: Icon(
                        Icons.settings,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("About"),
                      leading: Icon(
                        Icons.help,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: signOut,
                    child: ListTile(
                      title: Text("Log Out"),
                      leading: Icon(
                        Icons.logout,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(), // new
          controller: _controller,

          children: <Widget>[
            image_carousel,
            //padding widget
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                "Categories",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            //horizontal list view starts
            HorizontalList(),

            new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: new Text(
                "Frequently Bought Products",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),

            //Text(appProvider.featureProducts.length.toString()),

            //gridview starts

            /*Container(
              height: 310.0,
              child: ProductCard(),
            ),*/

            Container(
              child: Column(
                children: productProvider.products
                    .map((item) => GestureDetector(
                          //onTap: () {},
                          child: ProductCard(
                            product: item,
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
