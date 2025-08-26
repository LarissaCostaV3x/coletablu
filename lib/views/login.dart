import 'package:flutter/material.dart';
import '../consts/colors.dart';

///Login page
class LoginPage extends StatelessWidget {
  ///Login page constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: ColorsApp.text, fontSize: 20);

    return Scaffold(
      body: Column(
        children: [
          // Image.asset('images/logo_all.png'),
          Text(
            'Bem-vindo',
            style: titleStyle,
          ),
          const Text('Facilitando sua coleta e economia'),
          TextFormField(),
        ],
      ),
    );
  }
}
