import 'dart:async';
import 'package:rush_basket/Pages/HomeScreen.dart';
import 'package:rush_basket/Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState()=>_SplashPage();
}

class _SplashPage extends State<SplashPage>{
  @override
  void initState() {
    super.initState();
    whereTogo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(
            color:Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('assets/images/RushBasket.jpeg'),)
    );
  }

  void whereTogo() async{
    var prefs=await SharedPreferences.getInstance();
    bool? login=prefs.getBool('login');
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login==null||false?loginPage():HomePage()));
    });
  }
}

