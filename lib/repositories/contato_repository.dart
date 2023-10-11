import 'package:desafio_dio_lista_contatos/model/contatos_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContatoRepository {
  Future<ContatosModel> get() async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/pessoa',
    );
    var response = await http.get(url, headers: {
      "X-Parse-Application-Id": "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
      "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
      "content-type": "application/json"
    });
    var json = jsonDecode(response.body);

    return ContatosModel.fromJson(json);
  }

  Future<void> post(ContatoModel contatoModel) async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/pessoa',
    );
    try {
      await http.post(url,
          headers: {
            "X-Parse-Application-Id":
                "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
            "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
            "content-type": "application/json"
          },
          body: jsonEncode(contatoModel.toCreateJson()));
    } catch (e) {
      throw e;
    }
  }

  Future<void> put(ContatoModel contatoModel) async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/pessoa/${contatoModel.objectId}',
    );
    try {
      var result = await http.put(url,
          headers: {
            "X-Parse-Application-Id":
                "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
            "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
            "content-type": "application/json"
          },
          body: jsonEncode(contatoModel.toCreateJson()));
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete(String objectId) async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/pessoa/$objectId',
    );
    try {
      await http.delete(
        url,
        headers: {
          "X-Parse-Application-Id": "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
          "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
          "content-type": "application/json"
        },
      );
    } catch (e) {
      throw e;
    }
  }
}
