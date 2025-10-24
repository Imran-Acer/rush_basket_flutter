import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rush_basket/provider/themeProvider.dart';
import 'package:rush_basket/Pages/SplashScreen.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeManager>(create:(context)=>ThemeManager(),
      child:RushBasket(),)
  );
}

class RushBasket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(builder:(context,themeManager,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeManager.getTheme(),
          darkTheme:ThemeData.dark(),
          theme: ThemeData(primarySwatch: Colors.indigo
          ),
          home:SplashPage(),
        );
      }
    );
  }
}
