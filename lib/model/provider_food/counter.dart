import 'package:flutter/cupertino.dart';
import 'package:providerpractise/model/food_model.dart';

class FoodCount extends ChangeNotifier {
  var _foodCount = 0;
  var _cartvalue = 0;

  final List<FoodModel> _storefoodItem = [];

  getfoodCount() => _foodCount;
  getFoodList() => _storefoodItem;
  getcartValue() => _cartvalue;
  // getquantity() => _quantity;

  void removeFood(FoodModel b) {
    int l = _storefoodItem.indexOf(b);
    _foodCount = _foodCount - _storefoodItem[l].quantity;
    _cartvalue =
        _cartvalue - ((_storefoodItem[l].price) * (_storefoodItem[l].quantity));

    _storefoodItem[l].quantity =
        (_storefoodItem[l].quantity - _storefoodItem[l].quantity) + 1;
    _storefoodItem.removeAt(l);
    print('after delete${_storefoodItem}');
    notifyListeners();
  }

  void addfoodItem(FoodModel a) {
    _foodCount++; //basketcounter
    _cartvalue = _cartvalue + a.price; //total value

    if (_storefoodItem.contains(a)) {
      int k = _storefoodItem.indexOf(a);
      _storefoodItem[k].quantity += 1;
    } else {
      _storefoodItem.add(a);
    }

    // print(_storefoodItem);

    notifyListeners();
  }

  void addQuantity(FoodModel f) {
    int k = _storefoodItem.indexOf(f);
    _storefoodItem[k].quantity += 1;
    _cartvalue = _cartvalue + f.price;
    _foodCount++;
    notifyListeners();
  }

  void removeQuantity(FoodModel g) {
    int k = _storefoodItem.indexOf(g);
    if (_storefoodItem[k].quantity == 1) {
      removeFood(g);
    } else {
      _storefoodItem[k].quantity -= 1;
      _cartvalue = _cartvalue - g.price;
      _foodCount--;
    }

    notifyListeners();
  }
}
