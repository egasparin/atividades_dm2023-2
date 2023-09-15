import 'package:flutter/material.dart';

class DrawerPage {
  static Widget getWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: const Text('Livros'),
            onTap: () {
              Navigator.of(context).pushNamed('/livros');
            },
          ),
          ListTile(
            title: const Text('Listas'),
            onTap: () {
              Navigator.of(context).pushNamed('/listas');
            },
          ),
        ],
      ),
    );
  }
}
