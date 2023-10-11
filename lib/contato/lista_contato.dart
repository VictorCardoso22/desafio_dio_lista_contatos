import 'package:desafio_dio_lista_contatos/contato/cadastra_contato.dart';
import 'package:desafio_dio_lista_contatos/contato/cadastra_contato_viewmodel.dart';
import 'package:desafio_dio_lista_contatos/contato/lista_contato_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ListaContato extends StatefulWidget {
  const ListaContato({super.key});

  @override
  State<ListaContato> createState() => _ListaContatoState();
}

class _ListaContatoState extends State<ListaContato> {
  // ListaContatoViewModel listaContatoViewModel = ListaContatoViewModel();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   listaContatoViewModel.readContato();
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListaContatoViewModel>.reactive(
        viewModelBuilder: () => ListaContatoViewModel(),
        builder: (context, model, child) {
          return SizedBox(
            width: 480,
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: model.listContato.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nome: ${model.listContato[index].nome}'),
                                Text(
                                  'Numero: ${model.listContato[index].numero}',
                                  softWrap: true,
                                  maxLines: 2,
                                ),
                                Text(
                                    'Email: ${model.listContato[index].email}'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () async {
                              // await cadastraContatoViewModel
                              //     .updateContato(model.listContato[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadastraContato(
                                          cadastraContatoViewModel:
                                              model.listContato[index],
                                        )),
                              );
                            },
                            child: const Icon(Icons.edit),
                          ),
                          TextButton(
                            onPressed: () async {
                              await model.deleteContato(
                                  model.listContato[index].objectId!);
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
