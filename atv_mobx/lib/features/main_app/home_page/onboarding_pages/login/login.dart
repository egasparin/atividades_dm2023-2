import 'package:flutter/material.dart';
import 'form_login_page.dart';

import '../widgets/background.dart';

class OBLogin extends StatelessWidget {
  const OBLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return incluiStack();
  }

  Widget incluiStack() {
    return Stack(
      // define que cada filho usará toda a área da tela
      fit: StackFit.expand,
      // declaracao dos filhos
      children: [
        const OBBackground(
          imageProvider: AssetImage('assets/images/login.png'),
          headerText: 'Login',
          bodyText: '',
        ),
        OBFormLoginPage(),
      ],
    );
  }
}
