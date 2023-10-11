class ContatosModel {
  List<ContatoModel>? results;

  ContatosModel({this.results});

  ContatosModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ContatoModel>[];
      json['results'].forEach((v) {
        results!.add(new ContatoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContatoModel {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? nome;
  String? imagem;
  String? numero;
  String? email;

  ContatoModel(
      {this.objectId,
      this.createdAt,
      this.updatedAt,
      this.nome,
      this.imagem,
      this.numero,
      this.email});

  ContatoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nome = json['nome'];
    imagem = json['imagem'];
    numero = json['numero'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['numero'] = this.numero;
    data['email'] = this.email;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['numero'] = this.numero;
    data['email'] = this.email;
    return data;
  }
}
