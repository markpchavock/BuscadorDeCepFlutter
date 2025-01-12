class ViaCepModel {
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

  ViaCepModel(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.unidade,
      this.bairro,
      this.uf,
      this.localidade,
      this.estado,
      this.regiao,
      this.ibge,
      this.ddd});

  ViaCepModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    return data;
  }
}
