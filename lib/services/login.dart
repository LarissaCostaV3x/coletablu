import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///Login service
class LoginService {
  ///userUid
  late String userUid;

  ///firebase instance
  final firebase = FirebaseAuth.instance;

  ///create User method
  Future<void> createUser({required String email, required String password}) async {
    try {
      final createdUser = await firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = createdUser.user?.uid;
      if (uid == null) return;

      userUid = uid;
    } catch (e) {
      throw Exception('Falha ao criar usuário auth: $e');
    }
  }

  ///update User method
  Future<void> updateUser({required String email}) async {
    try {} catch (e) {
      throw Exception('Falha ao atualizar usuário auth $e');
    }
  }

  ///delete User method
  Future<void> deleteUser() async {
    try {
      await firebase.currentUser?.delete();
    } catch (e) {
      throw Exception('Falha ao deletar usuário auth $e');
    }
  }

  ///signIn method
  Future<void> signIn({
    required String email,
    required String password,
    required NavigatorState navigator,
  }) async {
    try {
      await firebase.signInWithEmailAndPassword(email: email, password: password);

      navigator.pushReplacementNamed('/mainApp');
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

  ///resetPassword method
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