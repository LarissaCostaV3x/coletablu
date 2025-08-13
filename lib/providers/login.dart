import 'package:flutter/material.dart';
import '../services/login.dart';

///Login provider
class LoginState extends ChangeNotifier {
  ///password visibility
  bool seePassword = false;

  ///user controller
  final TextEditingController userController = TextEditingController();

  ///password controller
  final TextEditingController passwordController = TextEditingController();

  ///form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///Login service instance
  final service = LoginService();

 
  ///toggle password visibility
  void toggleVisibility() {
    seePassword = !seePassword;
    notifyListeners();
  }

  ///login method
  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    try {
      await service.signIn(
        email: userController.text,
        password: passwordController.text,
        navigator: Navigator.of(context),
      );
    } catch (e) {
      if (context.mounted) {
        // showDialog(
        //   context: context,
        //   builder:
        //       (_) => ConfirmAlert(
        //         title: 'Erro ao fazer login',
        //         subtitle: e.toString().replaceAll('Exception:', '').trim(),
        //       ),
        // );
      }
    }
  }
}