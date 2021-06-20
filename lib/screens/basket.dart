import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractise/model/food_model.dart';
import 'package:providerpractise/model/provider_food/counter.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: Consumer<FoodCount>(
        builder: (context, data, child) {
          if (data.getFoodList().length == 0 ||
              data.getFoodList().length == null) {
            return Center(
              child: Text(
                'Ops! No items',
                style: TextStyle(color: Colors.grey),
              ),
            );
          } else
            return ListView.builder(
                itemCount: data.getFoodList().length,
                itemBuilder: (context, index) {
                  print('added food length:${data.getFoodList().length}');
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Text('x${data.getFoodList()[index].quantity}'),
                          title: Text(
                              '${data.getFoodList()[index].name.toString()}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  'Rs ${data.getFoodList()[index].price.toString()}'),
                              IconButton(
                                  onPressed: () => data
                                      .removeFood(data.getFoodList()[index]),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: IconButton(
                                  splashColor: Colors.transparent,
                                  onPressed: () => data
                                      .addQuantity(data.getFoodList()[index]),
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  )),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red)),
                              child: IconButton(
                                  splashColor: Colors.transparent,
                                  onPressed: () => data.removeQuantity(
                                      data.getFoodList()[index]),
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
        },
      ),
      bottomNavigationBar: Consumer<FoodCount>(
        builder: (context, data, child) {
          if (data.getcartValue() == 0) {
            return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Add Items',
                    style: TextStyle(color: Colors.blue),
                  ),
                ));
          } else {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Total: ${data.getcartValue()} Rs'),
              ),
            );
          }
        },
      ),
    );
  }
}
