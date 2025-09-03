import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///Login service
class LoginService {
  ///user uid
  late String userUid;

  ///firebase instance
  final firebase = FirebaseAuth.instance;

  ///signIn method
  Future<void> signIn({
    required String email,
    required String password,
    required NavigatorState navigator,
  }) async {
    try {

      await firebase.signInWithEmailAndPassword(email: email, password: password);

      navigator.pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      String? message;
      if (e.code == 'invalid-email') {
        message = 'Email inválido.';
      } else if (e.code == 'invalid-credential') {
        message = 'Senha inválida.';
      }

      throw Exception(message);
    } catch (e) {
      throw Exception('Falha ao fazer login');
    }
  }

  ///signOut method
  Future<void> signOut({required NavigatorState navigator}) async {
    await firebase.signOut();
    navigator.pushReplacementNamed('/login');
  }

  ///reset password method
  Future<void> resetPassword({required String email}) async {
    try {
      await firebase.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      String? message;
      if (e.code == 'user-not-found') {
        message = 'Usuário não encontrado.';
      } else if (e.code == 'invalid-email') {
        message = 'Email inválido.';
      }
      throw Exception(message);
    } catch (e) {
      throw Exception('Falha ao redefinir senha');
    }
  }
}
