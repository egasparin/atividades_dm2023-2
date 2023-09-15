import 'package:flutter/material.dart';
import 'package:myapp/home/presentation/home.dart';
import 'package:myapp/livro/presentation/list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'lista/presentation/list.dart';

// para rodar em modo watch, recompilando em tempo real o codigo gerado, use:
// dart run build_runner watch --delete-conflicting-outputs

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // late SettingsStore _settingsStore;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/livros': (context) => const LivroList(),
          '/listas': (context) => const ListaList(),
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
