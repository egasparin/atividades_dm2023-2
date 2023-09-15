import 'package:flutter/material.dart';

class DescricaoListaField extends StatelessWidget {
  final TextEditingController controller;

  const DescricaoListaField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Descrição'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira a descrição';
        }
        return null;
      },
    );
  }
}
