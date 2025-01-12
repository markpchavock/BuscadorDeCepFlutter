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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}
