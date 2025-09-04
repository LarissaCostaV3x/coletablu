part of './login_view.dart';

///Register modal for login page
Widget _registerDialog(BuildContext context) {
  final state = Provider.of<LoginState>(context);

  return AlertDialog(
    title: const Text('Cadastrar'),
    content: Column(
      children: [
        const Text('Para começar, crie sua conta'),
        Form(
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: state.nameController,
                decoration: const InputDecoration(
                  hintText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira um nome válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: state.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'Por favor, insira um email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: state.passwordController,
                obscureText: state.seePassword,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  suffix: InkWell(
                    onTap: state.toggleVisibility,
                    child: state.seePassword ? Text('a') : Text('b'),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty || value.length < 6) {
                    return 'Por favor, insira uma senha válida';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: state.passwordController,
                obscureText: state.seePassword,
                decoration: InputDecoration(
                  hintText: 'Confirmar Senha',
                  suffix: InkWell(
                    onTap: state.toggleVisibility,
                    child: state.seePassword ? Text('a') : Text('b'),
                  ),
                ),
                validator: (value) {
                  if (value != state.passwordController.text) {
                    return 'As senhas não coincidem.';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (!state.formKey.currentState!.validate()) return;
                  state.login(context);
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
