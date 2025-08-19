import 'package:flutter/material.dart';

import '../consts/colors.dart';

///Login page
class LoginPage extends StatelessWidget {
  ///Login page constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: ColorsApp.primary, fontSize: 24, fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: ColorsApp.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            height: 80,
          ),
          Text('Bem-vindo !', style: textStyle),
        ],
      ),
    );
  }
}
