import 'package:flutter/material.dart';
import 'package:wall_collections/src/pages/gallery.dart';
import 'package:wall_collections/src/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(fontFamily: 'Poppins'),      

      initialRoute: '/',

      routes: {

        '/' : (BuildContext context) => HomePage(),
        'galeria' : (BuildContext context) => Gallery()

      }

    );
  }
}