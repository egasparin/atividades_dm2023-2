import 'package:flutter/material.dart';

class AutorLivroField extends StatelessWidget {
  final TextEditingController controller;

  const AutorLivroField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Autor'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o autor do livro';
        }
        return null;
      },
    );
  }
}
