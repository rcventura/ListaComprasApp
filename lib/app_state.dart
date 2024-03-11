import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userID = prefs.getInt('ff_userID') ?? _userID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _userID = 0;
  int get userID => _userID;
  set userID(int value) {
    _userID = value;
    prefs.setInt('ff_userID', value);
  }

  List<dynamic> _shoppingListProducts = [];
  List<dynamic> get shoppingListProducts => _shoppingListProducts;
  set shoppingListProducts(List<dynamic> value) {
    _shoppingListProducts = value;
  }

  void addToShoppingListProducts(dynamic value) {
    _shoppingListProducts.add(value);
  }

  void removeFromShoppingListProducts(dynamic value) {
    _shoppingListProducts.remove(value);
  }

  void removeAtIndexFromShoppingListProducts(int index) {
    _shoppingListProducts.removeAt(index);
  }

  void updateShoppingListProductsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _shoppingListProducts[index] = updateFn(_shoppingListProducts[index]);
  }

  void insertAtIndexInShoppingListProducts(int index, dynamic value) {
    _shoppingListProducts.insert(index, value);
  }

  bool _creatingFromHome = false;
  bool get creatingFromHome => _creatingFromHome;
  set creatingFromHome(bool value) {
    _creatingFromHome = value;
  }

  List<dynamic> _indexShoppinglistproducts = [];
  List<dynamic> get indexShoppinglistproducts => _indexShoppinglistproducts;
  set indexShoppinglistproducts(List<dynamic> value) {
    _indexShoppinglistproducts = value;
  }

  void addToIndexShoppinglistproducts(dynamic value) {
    _indexShoppinglistproducts.add(value);
  }

  void removeFromIndexShoppinglistproducts(dynamic value) {
    _indexShoppinglistproducts.remove(value);
  }

  void removeAtIndexFromIndexShoppinglistproducts(int index) {
    _indexShoppinglistproducts.removeAt(index);
  }

  void updateIndexShoppinglistproductsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _indexShoppinglistproducts[index] =
        updateFn(_indexShoppinglistproducts[index]);
  }

  void insertAtIndexInIndexShoppinglistproducts(int index, dynamic value) {
    _indexShoppinglistproducts.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
