import 'package:flutter/material.dart';
import '../services/login.dart';

///Login provider
class LoginState extends ChangeNotifier {
  ///password visibility
  bool seePassword = false;

  ///user name controller
  final TextEditingController nameController = TextEditingController();

  ///user email controller
  final TextEditingController emailController = TextEditingController();

  ///user password controller
  final TextEditingController passwordController = TextEditingController();

  ///key of form in login page
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
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  ///login method to sign in plataformn
  Future<String?> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return 'Por favor, preencha os campos corretamente';
    try {
      await service.signIn(
        email: emailController.text,
        password: passwordController.text,
        navigator: Navigator.of(context),
      );
      return null;
    } catch (e) {
      return 'Falha ao fazer login: ${e.toString().replaceAll('Exception:', '').trim()}';
    }
  }

  ///logout method to sign out plataform
  Future<String?> logout(BuildContext context) async {
    try {
      await service.signOut(navigator: Navigator.of(context));
      return null;
    } catch (e) {
      return 'Falha ao fazer logout: ${e.toString().replaceAll('Exception:', '').trim()}';
    }
  }
}
