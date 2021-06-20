import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractise/model/food_model.dart';
import 'package:providerpractise/model/provider_food/counter.dart';

class FoodItems extends StatelessWidget {
  FoodItems({Key? key}) : super(key: key);

  final List foodItems = [
    FoodModel(id: 1, name: 'Mango', price: 60, quantity: 1),
    FoodModel(id: 2, name: 'Apple', price: 80, quantity: 1),
    FoodModel(id: 3, name: 'Guava', price: 90, quantity: 1),
    FoodModel(id: 4, name: 'Pineapple', price: 120, quantity: 1),
    FoodModel(id: 5, name: 'Watermelon', price: 150, quantity: 1),
    FoodModel(id: 7, name: 'Straberry', price: 110, quantity: 1),
    FoodModel(id: 8, name: 'Litchi', price: 50, quantity: 1),
    FoodModel(id: 9, name: 'Peach', price: 160, quantity: 1),
    FoodModel(id: 10, name: 'Banana', price: 180, quantity: 1),
    FoodModel(id: 11, name: 'Grape', price: 60, quantity: 1),
    FoodModel(id: 12, name: 'Dragon Fruit', price: 210, quantity: 1),
    FoodModel(id: 13, name: 'Jack Fruit', price: 105, quantity: 1),
    FoodModel(id: 14, name: 'Avocado', price: 280, quantity: 1),
    FoodModel(id: 15, name: 'Cherry', price: 135, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    print('Main Widget');

    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Fruits')),
        body: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              final counter = Provider.of<FoodCount>(context);
              return Card(
                  child: ListTile(
                onTap: () => counter.addfoodItem(foodItems[index]),
                title: Text(foodItems[index].name),
                trailing: Text('${foodItems[index].price.toString()} Rs/kg'),
              ));
            }),
        bottomNavigationBar:
            Consumer<FoodCount>(builder: (context, data, child) {
          if (data.getFoodList().isEmpty) {
            return Container(
              height: 0.0,
              child: Text(''),
            );
          } else
            return Container(
              height: MediaQuery.of(context).size.height / 15,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/basket'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          size: 30.0,
                        ),
                        Positioned(
                            top: 15.0,
                            right: 0.0,
                            child: Container(
                                padding: EdgeInsets.all(1),
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                                child: Text(
                                  '${data.getfoodCount().toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                )))
                      ],
                    ),
                    Text('Basket'),
                    Text(''),
                  ],
                ),
              ),
            );
        }));
  }
}
