import 'package:flutter/material.dart';
import 'onboarding_pages/about.dart';
import 'onboarding_pages/login/login.dart';
import 'onboarding_pages/welcome.dart';
import 'onboarding_pages/widgets/dots.dart';
import 'onboarding_pages/widgets/navigation_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // declarando as variaveis que nao devem ser reconstruidas pelo StatefulWidget
  final PageController _pageViewController = PageController();
  int _selectedPage = 0;

  // declarando a lista de paginas que terá o aplicativo
  final List<Widget> _pages = const [
    OBWelcome(),
    OBAbout(),
    OBLogin(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageViewController,
            children: _pages,
            onPageChanged: (value) => setState(() {
              _selectedPage = value;
            }),
          ),

          // Indicadores de pagina ao usuário

          Column(
            // alinha todas as linhas ao fundo da coluna
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // linha que contem os indicadores da pagina de usuario
              OBDots(totalPages: _pages.length, selectedPage: _selectedPage),
              // linha dos botões da aplicação
              OBNavigationButtons(
                totalPages: _pages.length,
                selectedPage: _selectedPage,
                pageController: _pageViewController,
              ),
            ],
          )
        ],
      ),
    );
  }
}
