import 'package:flutter/material.dart';
import 'widgets/background.dart';

class OBWelcome extends StatelessWidget {
  const OBWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const OBBackground(
      imageProvider: AssetImage('assets/images/welcome.png'),
      headerText: 'Seja bem vindo ao\n OnBoardingApp',
      bodyText: 'Este é o meu primeiro app usando MOBX',
    );
  }
}
