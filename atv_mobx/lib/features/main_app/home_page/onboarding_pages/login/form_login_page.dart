import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'login_store.dart';

// ignore: must_be_immutable
class OBFormLoginPage extends StatelessWidget {
  final loginStore = LoginStore();
  bool value = false;

  _errorMessage(String mensagem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          mensagem,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _accessRecovery(String mensagem) {
    return Row(
      children: [
        Text(
          mensagem,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            decorationColor: Colors.blue,
            decorationThickness: 1,
          ),
        ),
      ],
    );
  }

  OBFormLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          // alinha todas as linhas ao fundo da coluna
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // declaração dos campos
            TextField(
              onChanged: loginStore.changeEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email),
              ),
            ),

            Observer(
              builder: (_) {
                return Visibility(
                  visible: !loginStore.isEmailValid,
                  child: _errorMessage('Email inválido.'),
                );
              },
            ),

            TextField(
                onChanged: loginStore.changePassword,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Senha',
                  prefixIcon: Icon(Icons.security),
                )),

            Observer(
              builder: (_) {
                return Visibility(
                  visible: !loginStore.isPasswordValid,
                  child: _errorMessage('A senha não esta correta.'),
                );
              },
            ),

            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CheckboxWidget(),
                    SizedBox(width: 10),
                    Text(
                      'Lembrar do meu login e senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),

            Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: loginStore.isFormValid ? () {} : null,
                    child: const Text('Login'),
                  ),
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: _accessRecovery('Esqueci meu login e senha'),
                ),
                TextButton(
                  onPressed: () {},
                  child: _accessRecovery('Registrar'),
                ),
              ],
            ),
          ]),
    );
  }
}

// criando o checkbox
class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Colors.blue,
      onChanged: (newBool) {
        setState(() {
          isChecked = newBool!;
        });
      },
    );
  }
}
