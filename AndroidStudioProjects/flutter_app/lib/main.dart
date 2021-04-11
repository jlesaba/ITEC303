import 'package:flutter/material.dart';
import 'package:flutter_app/ui/RouteGenerator.dart';
import './ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      backgroundColor: Colors.white70,
    ),
  ));
}
