import 'package:flutter/material.dart';
import 'package:alimento/components/helpers.dart';
import 'package:alimento/models/restaurant.dart';
import 'package:alimento/models/food.dart';

ListView vListView(List<Food> food) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: food.length,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5.0,
          semanticContainer: true,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/food', arguments: {
                'name': food[index].name,
                'price': food[index].price,
                'cookTime': food[index].cookTime,
                'restaurantName': food[index].restaurantName,
                'restaurantId': food[index].restaurantId,
                'slug': food[index].slug,
                'image': food[index].image
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imageContainer('${food[index].image}'),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 15.0, bottom: 15.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${food[index].restaurantName}', style: Theme.of(context).textTheme.headline),
                      Row(
                        children: <Widget>[
                          Text('${food[index].name}', style: Theme.of(context).textTheme.caption),
                          Spacer(),
                          Icon(Icons.alarm),
                          SizedBox(width: 5.0),
                          Text('${food[index].cookTime}', style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                      Text('${food[index].price} Shs', style: Theme.of(context).textTheme.overline)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

SizedBox hListView(List<Restaurant> restaurant) {
  return SizedBox(
    height: 310,
    child: ListView.builder(
      itemCount: restaurant.length,
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 5.0,
              semanticContainer: true,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/restaurant', arguments: {
                    'name': restaurant[index].name,
                    'image': restaurant[index].image
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    imageContainer('${restaurant[index].image}'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${restaurant[index].name}', style: Theme.of(context).textTheme.headline),
                          Text('${restaurant[index].address}', style: Theme.of(context).textTheme.caption),
                          Text('${restaurant[index].phone}', style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}


