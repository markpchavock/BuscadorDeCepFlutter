import 'package:app_busca_cep_flutter/model/back4app_cep_model.dart';
import 'package:app_busca_cep_flutter/model/via_cep_model.dart';
import 'package:app_busca_cep_flutter/pages/cep_detail_page.dart';
import 'package:app_busca_cep_flutter/repositories/cep_back4app_repository.dart';
import 'package:app_busca_cep_flutter/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';

class CepCadastradoPage extends StatefulWidget {
  const CepCadastradoPage({super.key});

  @override
  State<CepCadastradoPage> createState() => _CepCadastradoPageState();
}

class _CepCadastradoPageState extends State<CepCadastradoPage> {
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();
  var cepBack4appRepository = CepBack4appRepository();
  var ceps = <CepResults>[];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    var result = await cepBack4appRepository.obterCeps();
    setState(() {
      ceps = result.results ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "CEP Cadastrado",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: ListView.builder(
            itemCount: ceps.length,
            itemBuilder: (context, index) {
              var cep = ceps[index];
              return Card(
                  child: ListTile(
                title: Text(cep.cep ?? "Sem CEP"),
                subtitle: Text("${cep.localidade ?? ""} - ${cep.uf ?? ""}"),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      var excluir =
                          await cepBack4appRepository.excluirCep(cep.objectId!);
                      if (excluir) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("CEP Excluido")));
                        carregarDados();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Erro ao Excluir o CEP")));
                      }
                    }),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CepDetailPage(cep: cep)));
                },
              ));
            },
          )),
    ));
  }
}


// Center(
//           child: Column(
//             children: [
//               Card(
//                 elevation: 8,
//                 surfaceTintColor: const Color.fromARGB(255, 252, 251, 251),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "00.000-00",
//                                 style: const TextStyle(
//                                     fontSize: 25, fontWeight: FontWeight.w900),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text("Cidade:"),
//                               const SizedBox(
//                                 width: 3,
//                               ),
//                               Text(
//                                 "Salvador-BA",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w900),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text("Bairro:"),
//                               const SizedBox(
//                                 width: 3,
//                               ),
//                               Text(
//                                 "Cajazeiras 11",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w900),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text("Complemento: "),
//                               const SizedBox(
//                                 width: 3,
//                               ),
//                               Text(
//                                 "Rua Juscelino Kubitchek",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w900),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Container(
//                           width: double.infinity,
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => CepDetailPage()));
//                               },
//                               child: const Text(
//                                 "Ler mais",
//                                 style: TextStyle(
//                                     decoration: TextDecoration.underline),
//                               )))
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),