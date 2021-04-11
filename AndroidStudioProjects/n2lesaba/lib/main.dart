import 'package:flutter/material.dart';
import 'package:n2lesaba/ui/RouteGenerator.dart';
import './ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.redAccent,
      backgroundColor: Colors.white70,
    ),
  ));
}