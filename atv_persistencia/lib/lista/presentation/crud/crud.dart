import 'package:flutter/material.dart';
import 'package:myapp/lista/presentation/crud/widgets/descricao.dart';
import 'package:myapp/lista/presentation/crud/widgets/nome.dart';
import 'package:myapp/livro/data/datasource/list.dart';
import 'package:myapp/livro/data/model/livro.dart';

import '../../data/datasource/insert.dart';
import '../../data/datasource/list.dart';
import '../../data/datasource/update.dart';
import '../../data/model/lista.dart';
import 'widgets/botao_gravar.dart';

class ListaForm extends StatefulWidget {
  final ListaModel? listaModel;

  const ListaForm({
    Key? key,
    this.listaModel,
  }) : super(key: key);

  @override
  ListaFormState createState() => ListaFormState();
}

class ListaFormState extends State<ListaForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  List _livrosAdicionados = [];
  List<LivroModel> _livrosCadastrados = [];

  @override
  void initState() {
    if (widget.listaModel != null) {
      _nomeController.text = widget.listaModel!.nome;
      _descricaoController.text = widget.listaModel!.descricao;

      _resgataLivrosAdicionados();
    }

    _resgataLivrosCadastrados();

    super.initState();
  }

  Future<void> _resgataLivrosCadastrados() async {
    final List<LivroModel> livros = await LivroListDataSource().getAll();

    setState(() {
      _livrosCadastrados = livros;
    });
  }

  // retorna os livros que ja estão relacionado a lista
  Future<void> _resgataLivrosAdicionados() async {
    if (widget.listaModel != null) {
      final List<LivroModel> livros = await ListaLivrosRelacaoDataSource()
          .get(lista: widget.listaModel as ListaModel);

      setState(() {
        _livrosAdicionados = livros;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Lista')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeListaField(controller: _nomeController),
                  DescricaoListaField(controller: _descricaoController),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  // lista de livros
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecione o livro para inserir na lista:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                        ),
                      )),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 200,
                    child: _livrosCadastrados.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Nenhum livro ainda adicionado',
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _livrosCadastrados.length,
                            itemBuilder: (BuildContext context, int index) {
                              final LivroModel livro =
                                  _livrosCadastrados[index];

                              final bool isSelected =
                                  _livrosAdicionados.contains(livro);

                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      livro.titulo,
                                      style: TextStyle(
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected ? Colors.blue : null,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _livrosAdicionados.remove(livro);
                                        } else {
                                          _livrosAdicionados.add(livro);
                                        }
                                      });
                                    },
                                    tileColor: isSelected
                                        ? Colors.blue.withOpacity(0.5)
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  ListaBotaoGravar(
                    onPressedNovo: () {
                      _nomeController.clear();
                      _descricaoController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final ListaModel lista = ListaModel(
                          nome: _nomeController.text,
                          descricao: _descricaoController.text,
                        );

                        if (widget.listaModel == null ||
                            widget.listaModel!.listaId == null) {
                          await ListaInsertDataSource().insert(lista: lista);

                          // adicionando a relação ao banco de dados
                          for (LivroModel livro in _livrosAdicionados) {
                            await ListaLivrosRelacaoInsertDataSource()
                                .insert(lista: lista, livro: livro);
                          }
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          lista.listaId = widget.listaModel!.listaId;
                          await ListaUpdateDataSource().update(lista: lista);

                          // adicionando a relação ao banco de dados
                          for (LivroModel livro in _livrosAdicionados) {
                            await ListaLivrosRelacaoInsertDataSource()
                                .insert(lista: lista, livro: livro);
                          }
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Lista criada'),
                        duration: Duration(seconds: 10),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
