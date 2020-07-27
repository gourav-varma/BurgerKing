import 'dart:convert';

import 'package:flutter/cupertino.dart';

class FakeDB extends ChangeNotifier{

  static final FakeDB _singleton = FakeDB._internal();
  FakeDB._internal();

  factory FakeDB(){
      return _singleton;
  }

  int _totalAmount = 0;
  int _items = 0;
  List _newproduct = [];
  bool _vegVal = false;

  get vegVal => _vegVal;

  set vegVal(bool val){
    _vegVal = val;
    notifyListeners();
  }

  get totalAmount => _totalAmount;

  set totalAmount(int val){
    _totalAmount = val;
    notifyListeners();
  }

  get items => _items;

  set items(int val){
    _items = val;
    notifyListeners();
  }


  get newproduct => _newproduct;

  set newproduct(List val){
    _newproduct = val;
    notifyListeners();
  }

  // incCount(List list,int index){
  //   notifyListeners();
  //   print("npnpnpnppnnppn$newproduct");
  // }

  // decCount(List list,int index){
  //   notifyListeners();
  // }
  
  // totAmount(List list){
  //   notifyListeners();
  //   print(totalAmount);
  // }

  api(String query, result){
    totalAmount = 0;
    newproduct = [];
    String json = jsonEncode(dbs);
    Map<String, dynamic> jsonData = jsonDecode(json);
    (jsonData["hello"] as List<dynamic>).forEach((element) {
      if(element[query]==result){
      newproduct.add(element);
      }
      notifyListeners();
    });
  }
  Map<String, dynamic> dbs ={"hello": [
    {
    "category": "Meal Combos",
    "title": "Crispy Chicken Supreme × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 170,
    "count": 0,
    "veg": false,
    "image": "assets/crispychickensupreme.JPG"
  },
  {
    "category": "Meal Combos",
    "title": "BK Veggie + Creamy Paneer Bowl",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 214,
    "count": 0,
    "veg": true,
    "image": "assets/bkvegiecreamypaneer(kingsaver).JPG"
  },
  {
    "category": "Meal Combos",
    "title": "Chicken Chilli Cheese Melt × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 258,
    "count": 0,
    "veg": false,
    "image": "assets/chickenchilli(kingssaver).JPG"
  },
  {
    "category": "Meal Combos",
    "title": "Veg Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 298,
    "count": 0,
    "veg": true,
    "image": "assets/vegwhopper(kingsaver).JPG"
  },
    {
    "category": "King Saver Combo",
    "title": "Crispy Chicken Supreme × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 170,
    "count": 0,
    "veg": false,
    "image": "assets/crispychickensupreme.JPG"
  },
  {
    "category": "King Saver Combo",
    "title": "BK Veggie + Creamy Paneer Bowl",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 214,
    "count": 0,
    "veg": true,
    "image": "assets/bkvegiecreamypaneer(kingsaver).JPG"
  },
  {
    "category": "King Saver Combo",
    "title": "Chicken Chilli Cheese Melt × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 258,
    "count": 0,
    "veg": false,
    "image": "assets/chickenchilli(kingssaver).JPG"
  },
  {
    "category": "King Saver Combo",
    "title": "Veg Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 298,
    "count": 0,
    "veg": true,
    "image": "assets/vegwhopper(kingsaver).JPG"
  },
  {
    "category": "Whopper",
    "title": "Chicken Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 318,
    "count": 0,
    "veg": false,
    "image": "assets/chickenwhopper(kingsaver).JPG"
  },
  {
    "category": "Whopper",
    "title": "Veg Whopper × 2",
    "subtitle": "Regular Meal With Fries(R) + Pepsi(R)",
    "cost": 298,
    "count": 0,
    "veg": true,
    "image": "assets/vegwhopper(kingsaver).JPG"
  },
  ]};
}