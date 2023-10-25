import 'package:flutter/material.dart';

class OBNavigationButtons extends StatelessWidget {
  final int selectedPage;
  final int totalPages;
  final PageController pageController;

  const OBNavigationButtons({
    super.key,
    required this.totalPages,
    required this.selectedPage,
    required this.pageController,

    // deve-se atentar que o valor em totalPages corresponde ao tamanho total
    // da lista de paginas, assim como o valor contido em selectPage corresponde
    // indice iniciado em 1, assim deve-se decrementar esse valor em (1) para
    // que a referencia da lista corresponda ao valor submetido

    // tem que componentizar os botoes para nao declarar sucessivamente eles
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // Utiliza todo o espaço entre os elemntos, concentrando
        // estes nas bordas
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Na primeira pagina, deve-se colocar um Spacer() para
          // ocupar o espaço do botão 'Anterior', visto que este não deve
          // ser renderizado para o usuário
          if (selectedPage == 0) const Spacer(),

          // Botão que faz para a pagina anterior
          Visibility(
            visible: selectedPage > 0,
            child: TextButton(
              onPressed: () => pageController.animateToPage((selectedPage - 1),
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate),
              child: const Text(
                'Anterior',
                style: TextStyle(
                  color: Colors.black,                  
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Na ultima pagina não deve aparecer o botão de 'Proximo'
          // mas para manter a lógica anterior, adiciona-se um Spacer()
          if (selectedPage == (totalPages - 1)) const Spacer(),

          // Botão que faz para a proxima pagina
          Visibility(
            visible: selectedPage < (totalPages - 1),
            child: TextButton(
              onPressed: () => pageController.animateToPage((selectedPage + 1),
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate),
              child: const Text(
                'Proximo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
