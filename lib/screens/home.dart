import 'package:alimento/components/mainComponent.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:alimento/styles/color.dart';
import 'package:alimento/components/mainComponent.dart';
import 'package:alimento/components/helpers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int counter = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alBackgroundGrey,
        appBar: AppBar(
          backgroundColor: alBackgroundWhite,
          title: Text('Alimento', style: Theme
              .of(context)
              .textTheme
              .headline),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: alDark),
              onPressed: () {},
            ),
            cartButton(),
            orderButton()
          ],
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mainLabel(context, 'RESTAURANTS'),
              new HorizontalList(),
              mainLabel(context, 'FOODS'),
              new VerticalList(),
            ],
          ),
        )
    );
  }

  Stack orderButton() {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_basket, color: alDark),
          onPressed: () {},
        ),
        counter != 0 ? Positioned(
          right: 25,
          top: 9,
          child: new Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
                color: alMain,
                shape: BoxShape.circle
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ) : null
      ],
    );
  }

  Stack cartButton() {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart, color: alDark),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        counter != 0 ? Positioned(
          right: 5,
          top: 9,
          child: new Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
                color: alMain,
                shape: BoxShape.circle
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ) : null
      ],
    );
  }
}


