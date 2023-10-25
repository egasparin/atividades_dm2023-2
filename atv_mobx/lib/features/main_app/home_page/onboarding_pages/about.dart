import 'package:flutter/material.dart';

import 'widgets/background.dart';

class OBAbout extends StatelessWidget {
  const OBAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return const OBBackground(
        imageProvider: AssetImage('assets/images/about.png'),
        headerText: 'Sobre o Aplicativo',
        bodyText:
            'Este é um aplicativo totalmente Stateles, mas gerenciado pelo MOBX');
  }
}
