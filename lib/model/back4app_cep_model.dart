class Back4AppCepModel {
  List<CepResults>? results;

  Back4AppCepModel({this.results});

  Back4AppCepModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results =
          // (json['results'] as List).map((v) => CepResults.fromJson(v)).toList();

          <CepResults>[];
      json['results'].forEach((v) {
        results!.add(CepResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['unidade'] = unidade;
    data['bairro'] = bairro;
    data['uf'] = uf;
    data['localidade'] = localidade;
    data['estado'] = estado;
    data['regiao'] = regiao;
    data['ibge'] = ibge;
    data['ddd'] = ddd;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
