import 'package:flutter/material.dart';

import '../../shared/widgets/drawpages.dart';
import '../../shared/widgets/mylisttile.dart';
import '../data/datasource/delete.dart';
import '../data/datasource/list.dart';
import '../data/model/lista.dart';
import 'crud/crud.dart';

class ListaList extends StatefulWidget {
  const ListaList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas de Livros'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: const NetworkImage(
                  'https://i.pinimg.com/736x/a1/62/f4/a162f45c40af149da77113b69e8db4c3.jpg'),
              fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<ListaModel>>(
          future: ListaListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                final List<ListaModel> listas = snapshot.data ?? [];

                if (listas.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhuma lista.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold)),
                  );
                }

                return ListView.builder(
                  itemCount: listas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ListaModel lista = listas[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        ListaDeleteDataSource()
                            .delete(id: lista.listaId as int);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            content: Text(
                              'Remoção bem sucedida',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      confirmDismiss: (direction) async {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Confirma remover?'),
                                content: Text(
                                    'Remover ${lista.nome.toUpperCase()}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Remover',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                      key: Key('$index'),
                      child: MyListTile(
                        isOdd: index.isOdd,
                        title: lista.nome,
                        line01Text: lista.descricao,
                        imagePath: 'assets/images/lista.png',
                        visivelSeLista: true,
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListaForm(
                                listaModel: lista,
                              ),
                            ),
                          );
                        },
                        onSharedPressed: () async {
                          // Future<XFile> geraArquivo(ListaModel lista) async {
                          //   Directory tempDir = await getTemporaryDirectory();
                          //   String tempPath = tempDir.path;
                          //   String fileName =
                          //       "image${DateTime.now().millisecondsSinceEpoch}";
                          //   File fileWrite = File("$tempPath/$fileName");

                          //   var json = jsonEncode(lista.toJson());
                          //   var bytes = json.codeUnits;

                          //   fileWrite.writeAsBytes(bytes);
                          //   final file = XFile("$tempPath/$fileName");
                          //   return file;
                          // }

                          // XFile file = await geraArquivo(lista);
                          // Share.shareXFiles([file],
                          //     text: 'Arquivo compartilhado');
                        },
                      ),
                    );
                  },
                );
              default:
                return Container(
                  color: Colors.red,
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListaForm()),
          );
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
