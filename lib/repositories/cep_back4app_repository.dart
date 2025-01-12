import 'package:app_busca_cep_flutter/model/back4app_cep_model.dart';
import 'package:app_busca_cep_flutter/model/via_cep_model.dart';
import 'package:app_busca_cep_flutter/repositories/back4app_custom_dio.dart';

class CepBack4appRepository {
  final _custonDio = Back4appCustonDio();

  CepBack4appRepository();

  Future<Back4AppCepModel> obterCeps() async {
    var url = "/CEP";
    var result = await _custonDio.dio.get(url);
    return Back4AppCepModel.fromJson(result.data);
  }

  Future<bool> verificarCep(String cep) async {
    try {
      var url = "/CEP?where={\"cep\":\"$cep\"}";
      var response = await _custonDio.dio.get(url);
      var data = response.data["results"];
      return data.isNotEmpty;
    } catch (e) {
      // ignore: avoid_print
      print("Erro ao verificar CEP : $e");
      return false;
    }
  }
/////////////////////Eu coloquei todos os métodos de manipulação no CepBack4appRepository
//////////////////////////////////////////////////
///////////////////////////////////////////////////
////
///////////////////////////////////////////////////////
  Future<bool> cadastrarCep(ViaCepModel viaCep) async {
    try {
      var url = "/CEP";
      var response = await _custonDio.dio.post(url, data: viaCep.toJson());
      return response.statusCode == 201;
    } catch (e) {
      // ignore: avoid_print
      print("Erro ao cadastrar o CEP: $e");
      return false;
    }
  }

  Future<bool> excluirCep(String id) async {
    try {
      var url = "/CEP/$id";
      var response = await _custonDio.dio.delete(url);
      return response.statusCode == 200; // Sucesso
    } catch (e) {
      // ignore: avoid_print
      print("Erro ao excluir CEP: $e");
      return false;
    }
  }

  Future<bool> atualizarCep(String id, Map<String, dynamic> dados) async {
    try {
      var url = "/CEP/$id";
      var response = await _custonDio.dio.put(url, data: dados);
      return response.statusCode == 200; // Sucesso
    } catch (e) {
      // ignore: avoid_print
      print("Erro ao atualizar CEP: $e");
      return false;
    }
  }
}
