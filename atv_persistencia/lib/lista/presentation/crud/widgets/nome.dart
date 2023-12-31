import 'package:flutter/material.dart';

class NomeListaField extends StatelessWidget {
  final TextEditingController controller;

  const NomeListaField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Nome'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o nome da lista';
        }
        return null;
      },
    );
  }
}
