import 'package:bikes/Models/bike.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bike => [..._bikes];

  int get total => _bikes.length;
  double somaTotal = 0;

  void addBike(Bike bike){
    _bikes.add(bike);
    notifyListeners();

  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    mPrice(bike);
    notifyListeners();
  }

  void sumPrice(Bike bike){
    somaTotal += bike.preco;
    notifyListeners();
  }
  void mPrice(Bike bike){
    somaTotal -= bike.preco;
    notifyListeners();
  }

  CheckListCart(Bike bike, Function addBike){
    String result ="Item já está no carrinho";
    if (!_bikes.contains(bike)) {
      addBike(bike);
      result ="Item adicionado com sucesso";
      sumPrice(bike);
    }
    return result;
  }
}