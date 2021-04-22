import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/components/error_box.dart';
import 'package:xlo_clone/screens/signup/components/field_title.dart';
import 'package:xlo_clone/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore store = SignupStore();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Observer(
                        builder: (_) => ErrorBox(
                          message: store.error,
                        ),
                      ),
                      const FieldTitle(
                        title: 'Apelido',
                        subtitle: 'Como aparecerá em seus anúncios',
                      ),
                      Observer(
                        builder: (_) => TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            hintText: 'Exemplo: João S.',
                            errorText: store.nameError,
                          ),
                          autocorrect: false,
                          onChanged: store.setName,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const FieldTitle(
                        title: 'E-mail',
                        subtitle: 'Enviaremos um e-mail de confirmação',
                      ),
                      Observer(
                        builder: (_) => TextField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            hintText: 'Exemplo: joao@gmail.com',
                            errorText: store.emailError,
                          ),
                          onChanged: store.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const FieldTitle(
                        title: 'Celular',
                        subtitle: 'Proteja sua conta',
                      ),
                      Observer(
                        builder: (_) => TextField(
                          enabled: !store.loading,
                          onChanged: store.setPhone,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            hintText: '(99) 99999-9999',
                            errorText: store.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          autocorrect: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const FieldTitle(
                        title: 'Senha',
                        subtitle: 'Use letras, números e caracteres especiais',
                      ),
                      Observer(
                        builder: (_) => TextField(
                          enabled: !store.loading,
                          obscureText: true,
                          onChanged: store.setPass1,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.pass1Error,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const FieldTitle(
                        title: 'Confirmar Senha',
                        subtitle: 'Repita a senha',
                      ),
                      Observer(
                        builder: (_) => TextField(
                          obscureText: true,
                          enabled: !store.loading,
                          onChanged: store.setPass2,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.pass2Error,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Observer(
                        builder: (_) => Container(
                          height: 40,
                          margin: const EdgeInsets.only(
                            top: 20,
                            bottom: 12,
                          ),
                          child: RaisedButton(
                            //onPressed: store.isFormValid ? store.signUp : null,
                            onPressed: store.signUpPressed,
                            disabledColor: Colors.orange.withAlpha(120),
                            disabledTextColor: Colors.white,
                            color: Colors.orange,
                            child: store.loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.white,
                                    ),
                                  )
                                : const Text('CADASTRAR'),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Já tem uma conta? ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
