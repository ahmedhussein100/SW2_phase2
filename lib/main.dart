import 'package:flutter/material.dart';


void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mobile shop',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.purple,
        ),
        home:
    );
  }
}