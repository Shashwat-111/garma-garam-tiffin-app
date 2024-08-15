import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

class MenuItem extends Equatable{
  final String kitchenName;
  final String foodName;
  final int id;
  final double price = 120;
  const MenuItem({required this.id, required this.foodName,required this.kitchenName});

  @override
  List<Object> get props => [id, kitchenName,foodName];
}

class CartProvider extends ChangeNotifier {

  List<MenuItem> initialMenuItem = [
    const MenuItem(id: 1, foodName: "Chole Thali", kitchenName: "Dubeys Kitchen"),
    const MenuItem(id: 2, foodName: "Paneer Butter Masala", kitchenName: "Sharma's Diner"),
    const MenuItem(id: 3, foodName: "Chicken Biryani", kitchenName: "Khan's Biryani House"),
    const MenuItem(id: 4, foodName: "Veggie Pizza", kitchenName: "Luigi's Pizzeria"),
    const MenuItem(id: 5, foodName: "Sushi Platter", kitchenName: "Tokyo Sushi Bar"),
    const MenuItem(id: 6, foodName: "Caesar Salad", kitchenName: "Healthy Bites"),
    const MenuItem(id: 7, foodName: "Butter Chicken", kitchenName: "Punjabi Dhaba"),
    const MenuItem(id: 8, foodName: "Vegan Tacos", kitchenName: "Green Bowl")
  ];


  final Map<MenuItem, int> _menuItemWithQuantity = {};

  Map<MenuItem, int> get menuItemWithQuantity => _menuItemWithQuantity;

  addToCart(MenuItem menuItem){
    if(_menuItemWithQuantity.containsKey(menuItem)){
      _menuItemWithQuantity[menuItem] = (_menuItemWithQuantity[menuItem]! + 1);
    }
    else {
      _menuItemWithQuantity[menuItem] = 1;
    }

    print(menuItemWithQuantity);
    notifyListeners();
  }

  removeFromCart(MenuItem menuItem){
    if(_menuItemWithQuantity.containsKey(menuItem)){
      if(_menuItemWithQuantity[menuItem]! > 1){
        _menuItemWithQuantity[menuItem] = (_menuItemWithQuantity[menuItem]! - 1);
      } else {
        _menuItemWithQuantity.remove(menuItem);
      }
      }
    print(menuItemWithQuantity);
    notifyListeners();
  }
}