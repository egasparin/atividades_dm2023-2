import 'package:flutter/material.dart';

class TituloLivroField extends StatelessWidget {
  final TextEditingController controller;

  const TituloLivroField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Titulo'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o titulo';
        }
        return null;
      },
    );
  }
}
