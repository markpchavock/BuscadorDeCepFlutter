import 'package:app_busca_cep_flutter/model/back4app_cep_model.dart';
import 'package:app_busca_cep_flutter/repositories/cep_back4app_repository.dart';
import 'package:flutter/material.dart';

class CepDetailPage extends StatefulWidget {
  final CepResults cep;

  CepDetailPage({required this.cep});

  @override
  State<CepDetailPage> createState() => _CepDetailPageState();
}

class _CepDetailPageState extends State<CepDetailPage> {
  late CepBack4appRepository cepBack4appRepository;
  var ceps = <Back4AppCepModel>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detalhes do CEP"),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Center(
              child: Card(
                elevation: 8,
                surfaceTintColor: const Color.fromARGB(255, 252, 251, 251),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cep.cep ?? "Não Encontrado",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Endereço: ${widget.cep.logradouro != null && widget.cep.logradouro!.isNotEmpty ? widget.cep.logradouro! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Complemento: ${widget.cep.complemento != null && widget.cep.complemento!.isNotEmpty ? widget.cep.complemento! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Bairro: ${widget.cep.bairro != null && widget.cep.bairro!.isNotEmpty ? widget.cep.bairro! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Cidade: ${widget.cep.localidade != null && widget.cep.localidade!.isNotEmpty ? widget.cep.localidade! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Estado: ${widget.cep.estado != null && widget.cep.estado!.isNotEmpty ? widget.cep.estado! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "UF: ${widget.cep.uf != null && widget.cep.uf!.isNotEmpty ? widget.cep.uf! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "DDD: ${widget.cep.ddd != null && widget.cep.ddd!.isNotEmpty ? widget.cep.ddd! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Região: ${widget.cep.regiao != null && widget.cep.regiao!.isNotEmpty ? widget.cep.regiao! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Unidade: ${widget.cep.unidade != null && widget.cep.unidade!.isNotEmpty ? widget.cep.unidade! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "IBGE: ${widget.cep.ibge != null && widget.cep.complemento!.isNotEmpty ? widget.cep.complemento! : "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Criado em: ${widget.cep.createdAt?.substring(0, 10) ?? "Não Informado"}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
