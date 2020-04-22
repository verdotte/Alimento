import 'package:flutter/material.dart';
import 'package:alimento/components/helpers.dart';

class Todo {
  final String title;
  final String description;
  Todo({this.title, this.description});
}


class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List<Todo> item = [
    Todo(title: 'La Casa', description: 'Best Restaurant to go'),
    Todo(title: 'Hellenique', description: 'Best Restaurant to go'),
    Todo(title: 'Chetemba', description: 'Best Restaurant to go'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        itemCount: item.length,
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
                      'title': item[index].title,
                      'description': item[index].description
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      imageContainer("https://food.jumia.com.ng/blog/wp-content/uploads/2016/05/Pizza-capricciosa.jpg"),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${item[index].title}', style: Theme.of(context).textTheme.headline),
                            Text('Bunia', style: Theme.of(context).textTheme.caption),
                            Text('0786777236', style: Theme.of(context).textTheme.caption),
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
}

class VerticalList extends StatefulWidget {

  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  List<Todo> item = [
    Todo(title: 'La Casa', description: 'Best Restaurant to go'),
    Todo(title: 'Hellenique', description: 'Best Restaurant to go'),
    Todo(title: 'Chetemba', description: 'Best Restaurant to go'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: item.length,
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
                  'title': item[index].title,
                  'description': item[index].description
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  imageContainer("https://www.thespruceeats.com/thmb/RUHqSPTY7h_2A3KGunxonCBvKrk=/1500x1000/filters:fill(auto,1)/juicy-baked-burgers-3052097-7-5b1054308e1b6e0036bc6cd1.jpg"),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 15.0, bottom: 15.0, right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Razak', style: Theme.of(context).textTheme.headline),
                        Row(
                          children: <Widget>[
                            Text('Pizza', style: Theme.of(context).textTheme.caption),
                            Spacer(),
                            Icon(Icons.alarm),
                            SizedBox(width: 5.0),
                            Text('20-30 Min', style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                        Text('20000 Shs', style: Theme.of(context).textTheme.overline)
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
}


