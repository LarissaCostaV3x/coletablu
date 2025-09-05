part of './login_view.dart';

///Register modal for login page
Widget _registerDialog(BuildContext context) {
  final state = Provider.of<LoginState>(context);
  final titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorsApp.text,
  );

  return AlertDialog(
    title: Center(child: Text('Cadastrar', style: titleStyle)),
    content: SizedBox(
      width: double.minPositive,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 18,
        children: [
          const Text('Para começar, crie sua conta', textAlign: TextAlign.center),
          Form(
            child: Column(
              spacing: 18,
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
                  style: ButtonsCustom.defaultElevatedButton.copyWith(
                    backgroundColor: WidgetStateProperty.all(ColorsApp.text),
                  ),
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
    ),
  );
}
