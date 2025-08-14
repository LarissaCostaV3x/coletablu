import 'package:flutter/material.dart';

import '../consts/theme.dart';

///Login page
class LoginPage extends StatelessWidget {
  ///Login page constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.secondary,
      body: Column(
        children: [
          Text('Bem-vindo !'),
        ],
      ),
    );
  }
}
