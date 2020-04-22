import 'package:flutter/material.dart';
import 'package:alimento/styles/color.dart';
import 'package:alimento/styles/color.dart';

class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  GlobalKey<FormState> _orderKey = GlobalKey();
  bool _valid = false;
  String txtLocation;
  String txtPhone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alBackgroundGrey,
      appBar:  AppBar(
        title: Text('Add Order', style: Theme
            .of(context)
            .textTheme.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          Form(
            key: _orderKey,
            autovalidate: _valid,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60.0),
                Text(
                  'CONFIRM ORDER',
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                      labelStyle: Theme.of(context).textTheme.caption,
                      focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: alDark, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
//                  validator: Validation.emailValidate,
                  onSaved: (email) => txtLocation = email,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      labelStyle: Theme.of(context).textTheme.caption,
                       focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: alDark, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                  ),
                  keyboardType: TextInputType.number,
//                  validator: Validation.passwordValidate,
                  onSaved: (pass) => txtPhone = pass,
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_location, size: 30.0,),
                      color: alMain,
                      onPressed: (){},
                    ),
                    Text('Use my current location', style: Theme.of(context).textTheme.caption)
                  ],
                ),
                SizedBox(height: 20.0),
                ButtonTheme(
                  minWidth: 310.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: alMain,
                    onPressed: (){},
                    child: Text('CONFIRM', style: Theme.of(context).textTheme.button),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
