import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alimento/styles/color.dart';
import 'package:alimento/components/mainComponent.dart';
import 'package:alimento/components/helpers.dart';
import 'package:alimento/models/restaurant.dart';
import 'package:alimento/models/food.dart';

class RestaurantFood extends StatefulWidget {
  @override
  _RestaurantFoodState createState() => _RestaurantFoodState();
}

class _RestaurantFoodState extends State<RestaurantFood> {

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    var food = Provider.of<List<Food>>(context);
    return Scaffold(
      backgroundColor: alBackgroundGrey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text('${args['name']}', style: Theme.of(context).textTheme.title),
                background: imageOpaque('${args['image']}'),
              ),
            ),
          ];
        },
        body: vListView(food)
      ),
    );
  }
}


