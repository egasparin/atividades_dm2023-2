import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/livro/presentation/crud/widgets/autor.dart';
import 'package:myapp/livro/presentation/crud/widgets/genero.dart';

import '../../data/datasource/insert.dart';
import '../../data/datasource/update.dart';
import '../../data/model/livro.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/titulo.dart';

class LivroForm extends StatefulWidget {
  final LivroModel? livroModel;

  const LivroForm({
    Key? key,
    this.livroModel,
  }) : super(key: key);

  @override
  LivroFormState createState() => LivroFormState();
}

class LivroFormState extends State<LivroForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  double _avaliacaoController = 3;

  @override
  void initState() {
    if (widget.livroModel != null) {
      _tituloController.text = widget.livroModel!.titulo;
      _autorController.text = widget.livroModel!.autor;
      _generoController.text = widget.livroModel!.genero;
      _avaliacaoController = widget.livroModel!.avaliacao!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Livro')),
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
                  TituloLivroField(controller: _tituloController),
                  AutorLivroField(controller: _autorController),
                  GeneroLivroField(controller: _generoController),
                  RatingBar.builder(
                    initialRating: _avaliacaoController,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      _avaliacaoController = rating;
                    },
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1.0,
                  ),
                  LivroBotaoGravar(
                    onPressedNovo: () {
                      _tituloController.clear();
                      _autorController.clear();
                      _generoController.clear();
                    },
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        final LivroModel livro = LivroModel(
                          titulo: _tituloController.text,
                          autor: _autorController.text,
                          genero: _generoController.text,
                          avaliacao: _avaliacaoController,
                        );

                        if (widget.livroModel == null ||
                            widget.livroModel!.livroId == null) {
                          await LivroInsertDataSource().insert(livro: livro);
                        } else {
                          // mas se ele ja existir, tem que fazer o update dos dados
                          livro.livroId = widget.livroModel!.livroId;
                          await LivroUpdateDataSource().update(livro: livro);
                        }
                      }

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Livro adicionado'),
                        duration: Duration(seconds: 2),
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
