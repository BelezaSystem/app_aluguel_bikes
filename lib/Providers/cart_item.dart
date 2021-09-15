import 'package:bikes/Models/bike.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bike => [..._bikes];

  int get total => _bikes.length;

  void addBike(Bike bike){
    _bikes.add(bike);
    notifyListeners();

  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }


  CheckListCart(Bike bike, Function addBike){


    String result ="";
    if (!_bikes.contains(bike)) {
      addBike(bike);
      result = "Item Adicionado com Sucesso";
    } else {
      result = "Item já está no carrinho";
    }
    return result;
  }
}