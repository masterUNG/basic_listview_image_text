import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data.dart';

class FoodListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FoodListViewState();
  }
}

class _FoodListViewState extends State<FoodListView> {
  List<Container> list() {
    int index = 0;
    return foods.map((food) {
      var container = Container(
        decoration: index % 2 == 0
            ? new BoxDecoration(color: Colors.lightBlueAccent)
            : new BoxDecoration(color: Colors.lightBlue),
        child: new Row(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10.0),
              child: new CachedNetworkImage(
                imageUrl: food.urlImageString,
                width: 150.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                    food.nameFoodString,
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ),
                new Container(
                  width: 200.0,
                  child: new Text(
                      food.detailFoodString,
                    style: new TextStyle(
                        color: Colors.white70,
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
      index = index + 1;
      return container;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Basic ListView Food"),
      ),
      body: new Container(
        child: new ListView(
          children: list(),
        ),
      ),
    );
  }
}
