import 'package:desafio_dio_lista_contatos/repositories/contato_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

import '../model/contatos_model.dart';

class ListaContatoViewModel extends BaseViewModel {
  List<ContatoModel> listContato = [];
  ListaContatoViewModel() {
    readContato();
  }

  Future readContato() async {
    var contato = ContatoRepository();
    ContatosModel listContatoBack = await contato.get();
    listContatoBack.results?.forEach((element) {
      listContato.add(element);
    });
    notifyListeners();
  }

  deleteContato(String id) async {
    var contato = ContatoRepository();
    print(id);
    await contato.delete(id);
    listContato.clear();
    await readContato();
    notifyListeners();
  }
}
