import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alimento/services/server.dart';
import 'package:alimento/models/restaurant.dart';

class RestaurantService with ChangeNotifier {

  bool _isLoading = false;
  get isLoading => _isLoading;
  
  Future<List<Restaurant>> getRestaurant() async {
    _isLoading = true;
    notifyListeners();
    try{
      final response =
      await Server().connect.get('https://ignoto.herokuapp.com/api/v1/restaurant');
      var data = json.decode(response.body);
      List<dynamic> r = data['data'];
      List<Restaurant> res = r.map(
            (dynamic item) => Restaurant.fromJson(item),
      ).toList();
      _isLoading = false;
      notifyListeners();
      return res;
    } catch(err) {
      throw Exception('Failed to load restaurant');
    }
  }

  Future<void> getFood() async {
    _isLoading = true;
    notifyListeners();
    try{
      final response =
      await Server().connect.get('https://ignoto.herokuapp.com/api/v1/feed');
      if(response.statusCode == 200){
        var data = json.decode(response.body);
        final Map res = data['data'];
        List<dynamic> food = res['food'];
        print(food.toString());
        _isLoading = false;
        notifyListeners();
        Server().disconnect;
      }
    } catch(err) {
      throw Exception('Failed to load food');
    }
  }
}
