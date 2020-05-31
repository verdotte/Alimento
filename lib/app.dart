import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alimento/routes/router.dart';
import 'package:alimento/styles/theme.dart';
import 'package:alimento/services/restaurantService.dart';
import 'package:alimento/services/foodService.dart';



class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestaurantService(),
        ),
        FutureProvider(
          create: (context) => RestaurantService().getRestaurant(),
        ),
        FutureProvider(
          create: (context) => FoodService().getFood(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodService(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        theme: alimentoTheme,
        routes: customRoutes
      ),
    );
  }
}


