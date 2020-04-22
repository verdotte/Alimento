import 'package:alimento/styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alimento/components/helpers.dart';

class Todo {
  final String title;
  final String description;
  Todo({this.title, this.description});
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Todo> item = [
    Todo(title: 'La Casa', description: 'Best Restaurant to go'),
    Todo(title: 'Hellenique', description: 'Best Restaurant to go'),
    Todo(title: 'Chetemba', description: 'Best Restaurant to go'),
    Todo(title: 'La Casa', description: 'Best Restaurant to go'),
    Todo(title: 'Hellenique', description: 'Best Restaurant to go'),
    Todo(title: 'Chetemba', description: 'Best Restaurant to go'),
  ];

  int quantity = 1;
  int price = 20000;
  int total = 300000;
  final initialPrice = 20000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alBackgroundGrey,
      appBar: AppBar(
        title: Text('Cart', style: Theme
            .of(context)
            .textTheme
            .title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: item.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5.0,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              height: 125,
                              child: imageContainer("https://www.thespruceeats.com/thmb/RUHqSPTY7h_2A3KGunxonCBvKrk=/1500x1000/filters:fill(auto,1)/juicy-baked-burgers-3052097-7-5b1054308e1b6e0036bc6cd1.jpg"),
                            ),
                          ),
                          Container(
                            width: 210,
                            height: 125,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('Pizza', style: Theme.of(context).textTheme.caption),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        color: alMain,
                                        onPressed:(){
                                        },
                                      ),
                                    ],
                                  ),
                                  Text('20000 Shs', style: Theme.of(context).textTheme.overline),
                                  quantityHandler(context),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          footWidget(context),
        ],
      ),
    );
  }

  Container footWidget(BuildContext context) {
    return Container(
          color: alBackgroundWhite,
          height: MediaQuery.of(context).size.height * .20,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Total Price', style: Theme.of(context).textTheme.headline),
                    Spacer(),
                    Text('$total Shs', style: Theme.of(context).textTheme.headline),
                  ],
                ),
                Divider(color: Colors.grey),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: ButtonTheme(
                        height: 40.0,
                        minWidth: 300.0,
                        child: RaisedButton(
                          color: alMain,
                          onPressed: (){
                            Navigator.pushNamed(context, '/order');
                          },
                          child: Text('CLEAR', style: Theme.of(context).textTheme.button),
                        ),
                      ),
                    ),
                    SizedBox(width: 60.0,),
                    Flexible(
                      child: ButtonTheme(
                        height: 40.0,
                        minWidth: 300.0,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: (){
                            Navigator.pushNamed(context, '/order');
                          },
                          child: Text('CHECKOUT', style: Theme.of(context).textTheme.button),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
  }

  Row quantityHandler(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('$price Shs', style: Theme.of(context).textTheme.caption),
        Spacer(),
        IconButton(
          icon: Icon(Icons.remove),
          color: Colors.green,
          onPressed: quantity <= 1 ? null : (){
            setState(() {
              if(quantity > 1){
                quantity--;
                price -= initialPrice;
              }
            });
          },
        ),
        Spacer(),
        Expanded(child: Text('$quantity', style: Theme.of(context).textTheme.caption)),
        Spacer(),
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.green,
          onPressed: quantity >= 10 ? null : () {
            setState(() {
              if(quantity < 10){
                quantity++;
                price += initialPrice;
              }
            });
          },
        ),
      ],
    );
  }
}
