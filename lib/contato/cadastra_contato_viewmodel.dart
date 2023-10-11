import 'package:desafio_dio_lista_contatos/contato/lista_contato_viewmodel.dart';
import 'package:desafio_dio_lista_contatos/model/contatos_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../repositories/contato_repository.dart';

class CadastraContatoViewModel extends BaseViewModel {
  ContatoModel contatoModel = ContatoModel();
  ListaContatoViewModel listaContatoViewModel = ListaContatoViewModel();
  TextEditingController nomeController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  CadastraContatoViewModel();

  saveContato(ContatoModel contatoModel) async {
    var contato = ContatoRepository();

    await contato.post(ContatoModel(
      nome: contatoModel.nome,
      numero: contatoModel.numero,
      email: contatoModel.email,
      imagem: contatoModel.imagem,
    ));

    listaContatoViewModel.listContato.clear();
    await listaContatoViewModel.readContato();
    notifyListeners();
  }

  updateContato(ContatoModel contatoModel) async {
    var contato = ContatoRepository();

    await contato.put(ContatoModel(
      objectId: contatoModel.objectId,
      nome: contatoModel.nome,
      numero: contatoModel.numero,
      email: contatoModel.email,
      imagem: contatoModel.imagem,
    ));

    listaContatoViewModel.listContato.clear();
    await listaContatoViewModel.readContato();
    notifyListeners();
  }
}
