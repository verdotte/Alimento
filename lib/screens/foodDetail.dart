import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alimento/styles/color.dart';
import 'package:alimento/components/helpers.dart';

class FoodDetail extends StatefulWidget {
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quantity = 1;
  int price = 20000;
  final initialPrice = 20000;
  String name;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    name = args['restaurantName'];
    return Scaffold(
      appBar: AppBar(
        title: Text('${args['name']}', style: Theme
            .of(context)
            .textTheme
            .title),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * .40,
                  child: imageContainer('${args['image']}'),
                ),
                new Container(
                  height: MediaQuery.of(context).size.height * .60,
                  color: alBackgroundGrey,
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .28,
                  right: 20.0,
                  left: 20.0
              ),
              child: Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5.0,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('$name', style: Theme.of(context).textTheme.headline),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Text('${args['name']}', style: Theme.of(context).textTheme.caption),
                            Spacer(),
                            Icon(Icons.alarm),
                            SizedBox(width: 5.0),
                            Text('${args['cookTime']}', style: Theme.of(context).textTheme.caption),
                            SizedBox(height: 30.0),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        quantityWidget(context),
                        SizedBox(height: 20.0),
                        ButtonTheme(
                          minWidth: 300.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: alMain,
                            onPressed: (){
                              Navigator.pushNamed(context, '/order');
                            },
                            child: Text('ADD TO CART', style: Theme.of(context).textTheme.button),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }

  Row quantityWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(
                    color: quantity <= 1 ? alBackgroundGrey : Colors.green,
                    style: BorderStyle.solid,
                    width: 1.0
                )
            ),
          ),
          child: IconButton(
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
        ),
        Spacer(),
        Text('$quantity', style: Theme.of(context).textTheme.headline),
        Spacer(),
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(
                    color: quantity >= 10 ? alBackgroundGrey : Colors.green,
                    style: BorderStyle.solid,
                    width: 1.0
                )
            ),
          ),
          child: IconButton(
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
        ),
        Spacer(),
        Text('$price Shs', style: Theme.of(context).textTheme.headline),
      ],
    );
  }
}
