import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alimento/styles/color.dart';
import 'package:alimento/components/mainComponent.dart';
import 'package:alimento/components/helpers.dart';
import 'package:alimento/models/restaurant.dart';
import 'package:alimento/models/food.dart';
import 'package:alimento/services/restaurantService.dart';
import 'package:alimento/services/foodService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController;
  int counter = 12;
  bool show = false;

  _scrollListener() {
    var isEnd = _scrollController.offset == _scrollController.position.maxScrollExtent;
    if (isEnd){
      setState(() {
        show = true;
      });
    }
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var restaurant = Provider.of<List<Restaurant>>(context);
    var restaurantState = Provider.of<RestaurantService>(context);
    var food = Provider.of<List<Food>>(context);
    var foodState = Provider.of<FoodService>(context);
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
              onPressed: () {
              },
            ),
            cartButton(),
            orderButton()
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: ScrollPhysics(),
          child: (restaurant != null && food != null ) ?
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mainLabel(context, 'RESTAURANTS'),
              hListView(restaurant),
              mainLabel(context, 'FOODS'),
              vListView(food),
            ],
          ): Center(child: loader())
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


