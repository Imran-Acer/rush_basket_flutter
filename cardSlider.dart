import 'package:flutter/cupertino.dart';
import 'dart:async';
class CardSlider extends ChangeNotifier{
  int _index=0;
  CardSlider(){
    indexChanger();
  }
  getIndex()=>_index;

  indexChanger(){
    _index=(_index+1)%3;
    notifyListeners();

    Timer(Duration(seconds:2),(){
      indexChanger();
    });
  }
}