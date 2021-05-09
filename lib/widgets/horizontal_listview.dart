import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: "images/veg.jpg",
            image_caption: 'Fruits & Veggies',
          ),
          Category(
            image_location: "images/foodbvg.jpg",
            image_caption: 'Food & Beverages',
          ),
          Category(
            image_location: "images/household.jpg",
            image_caption: 'Household Supplies',
          ),
          Category(
            image_location: "images/beauty.jpg",
            image_caption: 'Beauty & Grooming',
          ),
          Category(
            image_location: "images/health.jpg",
            image_caption: 'Nutrition & Healthcare',
          ),
          Category(
            image_location: "images/stationary.jpg",
            image_caption: "Stationary",
          ),
          Category(
            image_location: "images/baby.jpg",
            image_caption: "Baby Supplies",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          height: 80.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 70.0,
              height: 64.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter, child: Text(image_caption)),
          ),
        ),
      ),
    );
  }
}
