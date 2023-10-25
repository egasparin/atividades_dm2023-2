import 'package:flutter/material.dart';

import 'features/widgets/card.dart';
import 'features/widgets/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> titleNews = [
      'A economia esta decolando.',
      'Seleção brasileira goleia a Bolivia.',
      'Adeque seu café-da-manhã',
    ];

    List<String> detailsNews = [
      'Brasil é beneficiado quando os preços das commodities sobem, pois o país é um grande exportador do agronegócio, minério de ferro e petróleo. O preço do que o Brasil exporta em relação ao que importa tem uma relação positiva para a balança comercial e as exportações subiram aceleradamente. No caso das exportações agrícolas, elas quase dobraram.',
      'A Seleção Brasileira goleou a Bolívia por 5 a 1, nesta sexta-feira (8), em Belém (PA), no Mangueirão, e iniciou as Eliminatórias para a Copa do Mundo de 2026 com o pé direito. Os gols da vitória do Brasil foram marcados por Rodrygo (duas vezes), Raphinha e Neymar (duas vezes), que ultrapassou Pelé na artilharia histórica da Amarelinha. Os bolivianos descontaram com Ábrego.',
      'Estudo mostra que ingerir a maior parte das calorias diárias na primeira refeição do dia não aumenta o gasto energético; por outro lado, traz mais saciedade. Um novo estudo acaba de revelar que o velho ditado "tome café da manhã como um rei, almoce como um príncipe e jante como um plebeu" não passa de um mito.',
    ];

    List<String> imageNews = [
      'assets/economia.png',
      'assets/brasil.png',
      'assets/cafe.png',
    ];

    List<NewsCard> listNews = List.generate(
        20,
        (index) => NewsCard(
              newsTitle: titleNews[index % 3],
              imagePath: imageNews[index % 3],
              detailsNews: detailsNews[index % 3],
            ));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Noticias Atuais'),
        ),
        body: MyCardList(listNews: listNews));
  }
}
