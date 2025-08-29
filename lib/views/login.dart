import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/colors.dart';
import '../providers/login.dart';

///Login page
class LoginPage extends StatelessWidget {
  ///Login page constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: ColorsApp.text, fontWeight: FontWeight.bold);
    final richStyle = TextStyle(color: ColorsApp.primary, fontWeight: FontWeight.bold);
    final state = Provider.of<LoginState>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Center(
                    child: Image.asset(
                      'images/logo_all.png',
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Bem-vindo!',
                    style: titleStyle,
                  ),
                  const Text('Faça login na plataforma e facilite sua coleta'),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Form(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Por favor, insira um email';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Senha',
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Por favor, insira um email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (!state.formKey.currentState!.validate()) return;
                              },
                              child: const Text('Entrar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu a senha?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
                        children: [
                          const TextSpan(text: 'Não possui uma conta? '),
                          TextSpan(
                            text: 'Cadastre-se',
                            style: richStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('images/glass.png'),
          ),
        ],
      ),
    );
  }
}
