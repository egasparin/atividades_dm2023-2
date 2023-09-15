import 'package:flutter/material.dart';

class GeneroLivroField extends StatelessWidget {
  final TextEditingController controller;

  const GeneroLivroField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Gerero'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o genero do livro';
        }
        return null;
      },
    );
  }
}
