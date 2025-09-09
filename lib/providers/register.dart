import 'package:flutter/material.dart';

///Register provider for register modal
class RegisterState extends ChangeNotifier {
  ///text controller of name user for new register
  final TextEditingController nameController = TextEditingController();

  ///text controller of email user for new register

  final TextEditingController emailController = TextEditingController();

  ///text controller of name passworld for new register

  final TextEditingController passwordController = TextEditingController();

  ///key form for register modal

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///boolean to see or not the password
  bool seePassword = true;

  ///boolean to confirm password
  bool confirmPassword = true;

  ///function to toggle the visibility of password
  void toggleVisibility(String type) {
    if (type == 'password') {
      seePassword = !seePassword;
    } else if (type == 'confirmPassword') {
      confirmPassword = !confirmPassword;
    } else {
      throw ArgumentError('Invalid type: $type');
    }
    notifyListeners();
  }
}
