import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotiflutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        primaryTextTheme: TextTheme(
          subtitle: TextStyle(color: Colors.white),
          title: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          caption: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)
        )
      ),
      home: HomeModule(),
    );
  }
}
