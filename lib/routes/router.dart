import 'package:flutter/material.dart';
import 'package:alimento/screens/home.dart';
import 'package:alimento/screens/defaultScreen.dart';
import 'package:alimento/screens/cart.dart';
import 'package:alimento/screens/foodDetail.dart';
import 'package:alimento/screens/restaurantFood.dart';
import 'package:alimento/screens/addOrder.dart';

var customRoutes = <String, WidgetBuilder> {
  '/': (_) => Home(),
  '/restaurant': (_) => RestaurantFood(),
  '/food': (_) => FoodDetail(),
  '/cart': (_) => Cart(),
  '/order': (_) => AddOrder(),
  '*': (_) => DefaultScreen()
};