import 'package:flutter/material.dart';
import 'package:n2lesaba/ui/FirstPage.dart';
import 'package:n2lesaba/ui/home_page.dart';
import 'package:n2lesaba/ui/connect_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LearningStatefulWidgets(title: "N2Lesaba"));
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