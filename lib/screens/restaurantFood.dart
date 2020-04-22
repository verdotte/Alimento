import 'package:flutter/material.dart';
import 'package:alimento/components/mainComponent.dart';
import 'package:alimento/components/helpers.dart';
import 'package:alimento/styles/color.dart';

class RestaurantFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
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
                title: Text('${args['title']}', style: Theme.of(context).textTheme.title),
                background: imageOpaque("https://food.jumia.com.ng/blog/wp-content/uploads/2016/05/Pizza-capricciosa.jpg"),
              ),
            ),
          ];
        },
        body: new VerticalList(),
      ),
    );
  }
}


