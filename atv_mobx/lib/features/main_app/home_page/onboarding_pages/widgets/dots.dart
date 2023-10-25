import 'package:flutter/material.dart';

class OBDots extends StatelessWidget {
  final int totalPages;
  final int selectedPage;

  const OBDots(
      {super.key, required this.totalPages, required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.only(right: 5),
          duration: const Duration(milliseconds: 150),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
          // Mudando o tamanho conforme a seleção da pagina
          // tem que usar o operador ternario
          width: selectedPage == index ? 20 : 15,
          height: selectedPage == index ? 20 : 10,
        ),
      ),
    );
  }
}
