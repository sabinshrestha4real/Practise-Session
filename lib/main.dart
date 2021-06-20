import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractise/model/food_model.dart';
import 'package:providerpractise/model/provider_food/counter.dart';
import 'package:providerpractise/screens/basket.dart';
import 'package:providerpractise/screens/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FoodCount>(
      create: (context) => FoodCount(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ChangeNotifierProvider<FoodCount>(
        //     create: (context) => FoodCount(), child: FoodItems()),
        initialRoute: '/',
        routes: {
          '/': (context) => FoodItems(),
          '/basket': (context) => Basket(),
        },
      ),
    );
  }
}
