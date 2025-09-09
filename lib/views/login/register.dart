part of './login_view.dart';

///Register modal for login page
Widget _registerDialog(BuildContext context) {
  final state = Provider.of<RegisterState>(context);
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
            key: state.formKey,
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
                      return 'Insira um nome válido';
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
                      return 'Insira um email válido';
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
                      onTap: () => state.toggleVisibility('password'),
                      child:
                          state.seePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Insira uma senha válida';
                    } else if (value.length < 6) {
                      return 'Senha com no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: TextEditingController(),
                  obscureText: state.confirmPassword,
                  decoration: InputDecoration(
                    hintText: 'Confirmar Senha', //TODO
                    suffix: InkWell(
                      onTap: () => state.toggleVisibility('confirmPassword'),
                      child: state.confirmPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  ),
                  validator: (value) {
                    if (value != state.passwordController.text) {
                      return 'As senhas não coincidem.';
                    } else if (value == null || value.trim().isEmpty || value.length < 6) {
                      return 'Insira uma senha válida';
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
                    // state.login(context);
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
