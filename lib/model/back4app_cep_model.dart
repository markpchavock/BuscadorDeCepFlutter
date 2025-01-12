class Back4AppCepModel {
  List<CepResults>? results;

  Back4AppCepModel({this.results});

  Back4AppCepModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results =
          // (json['results'] as List).map((v) => CepResults.fromJson(v)).toList();

          <CepResults>[];
      json['results'].forEach((v) {
        results!.add(new CepResults.fromJson(v));
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

class CepResults {
  String? objectId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? unidade;
  String? bairro;
  String? uf;
  String? localidade;
  String? estado;
  String? regiao;
  String? ibge;
  String? ddd;
  String? createdAt;
  String? updatedAt;

  CepResults(
      {this.objectId,
      this.cep,
      this.logradouro,
      this.complemento,
      this.unidade,
      this.bairro,
      this.uf,
      this.localidade,
      this.estado,
      this.regiao,
      this.ibge,
      this.ddd,
      this.createdAt,
      this.updatedAt});

  CepResults.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    unidade = json['unidade'];
    bairro = json['bairro'];
    uf = json['uf'];
    localidade = json['localidade'];
    estado = json['estado'];
    regiao = json['regiao'];
    ibge = json['ibge'];
    ddd = json['ddd'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['unidade'] = this.unidade;
    data['bairro'] = this.bairro;
    data['uf'] = this.uf;
    data['localidade'] = this.localidade;
    data['estado'] = this.estado;
    data['regiao'] = this.regiao;
    data['ibge'] = this.ibge;
    data['ddd'] = this.ddd;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
