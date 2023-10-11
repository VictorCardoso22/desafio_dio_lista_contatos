import 'package:desafio_dio_lista_contatos/model/contatos_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cadastra_contato_viewmodel.dart';

class CadastraContato extends StatefulWidget {
  ContatoModel? cadastraContatoViewModel;
  CadastraContato({super.key, this.cadastraContatoViewModel});

  @override
  State<CadastraContato> createState() => _CadastraContatoState();
}

class _CadastraContatoState extends State<CadastraContato> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CadastraContatoViewModel>.reactive(
        viewModelBuilder: () => CadastraContatoViewModel(),
        builder: (context, model, child) {
          if (widget.cadastraContatoViewModel != null) {
            model.nomeController.text = widget.cadastraContatoViewModel!.nome!;
            model.numeroController.text =
                widget.cadastraContatoViewModel!.numero!;
            model.emailController.text =
                widget.cadastraContatoViewModel!.email!;
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Adicionar novo Contato'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: model.nomeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite o nome',
                    ),
                    onChanged: (value) => print(model.nomeController.text),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: model.numeroController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite o numero',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: model.emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite o email',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                      onPressed: () async {
                        if (widget.cadastraContatoViewModel != null) {
                          print("atulaiza?");
                          await model.updateContato(
                            ContatoModel(
                              objectId:
                                  widget.cadastraContatoViewModel!.objectId!,
                              nome: model.nomeController.text,
                              numero: model.numeroController.text,
                              email: model.emailController.text,
                              imagem: "img.png",
                            ),
                          );
                          print(model.nomeController.text);
                        } else {
                          print("cadastra?");
                          await model.saveContato(
                            ContatoModel(
                              nome: model.nomeController.text,
                              numero: model.numeroController.text,
                              email: model.emailController.text,
                              imagem: "img.png",
                            ),
                          );
                          setState(() {});
                        }

                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.add_circle,
                      ),
                      label: widget.cadastraContatoViewModel != null
                          ? const Text('Atualizar')
                          : const Text('Adicionar')),
                ],
              ),
            ),
          );
        });
  }
}
