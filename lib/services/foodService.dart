import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alimento/services/server.dart';
import 'package:alimento/models/food.dart';

class FoodService with ChangeNotifier {

  bool _isLoading = false;
  get isLoading => _isLoading;

  Future<List<Food>> getFood() async {
    _isLoading = true;
    notifyListeners();
    try{
      final response =
      await Server().connect.get('https://ignoto.herokuapp.com/api/v1/feed');
      var data = json.decode(response.body);
      final Map resData = data['data'];
      List<dynamic> food = resData['food'];
      List<Food> res = food.map(
            (dynamic item) => Food.fromJson(item),
      ).toList();
      _isLoading = false;
      notifyListeners();
      return res;
    } catch(err) {
      throw Exception('Failed to load food');
    }
  }
}