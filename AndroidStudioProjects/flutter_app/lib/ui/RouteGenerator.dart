import 'package:flutter/material.dart';
import 'package:flutter_app/ui/FirstPage.dart';
import 'package:flutter_app/ui/home_page.dart';
import 'package:flutter_app/ui/connect_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LearningStatefulWidgets(title: "My First Flutter App"));
      case '/first':
        if(args is String) {
          return MaterialPageRoute(builder: (_) => FirstPage(data: args));
        }
        break;
      case '/connectwww':
        return MaterialPageRoute(
            builder: (_) => ConnectPage(),
        );
    }
  }
}