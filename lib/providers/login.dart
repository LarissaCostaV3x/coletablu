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

  ///reset login form inputs
  void resetInputs() {
    userController.clear();
    passwordController.clear();
    notifyListeners();
  }

  ///login method to sign in plataformn
  Future<bool> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;
    try {

      await service.signIn(
        email: userController.text,
        password: passwordController.text,
        navigator: Navigator.of(context),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  ///logout method to sign out plataform
  Future<bool> logout(BuildContext context) async {
    try {
      await service.signOut(navigator: Navigator.of(context));
      return true;
    } catch (e) {
      return false;
    }
  }
}
