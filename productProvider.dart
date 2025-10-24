import 'package:flutter/cupertino.dart';
import 'package:rush_basket/Models/product.dart';
import 'package:rush_basket/services/api.dart';
class ProductProvider extends ChangeNotifier {
  ProductProvider(){
    fetch();
  }
  List<dynamic> productList = [];
  List<Product> allProduct=[];
  fetch() async {
    List<Product> temp=[];
    productList=await API.fetchApi();
    for (var product in productList){
      Product newCurrency=Product.fromJson(product);
      temp.add(newCurrency);
    }
    allProduct=temp;
    notifyListeners();
  }
}