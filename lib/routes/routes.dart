import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../views/login/login_view.dart';

// ignore: avoid_classes_with_only_static_members
///named routes
class Routes {
  ///create routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 250),
          child: const LoginPage(),
        );
      case '/home':
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 250),
          child: const Placeholder(),
        );
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 250),
          child: Scaffold(body: Text('Página não encontrada')),
        );
    }
  }
}
