import 'package:flutter/material.dart';
import 'package:hava_durumu/screens/Ana_Ekran.dart';
import 'package:hava_durumu/screens/yukleme_ekrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoadingScreen(),
    );
  }
}
