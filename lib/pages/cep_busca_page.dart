import 'package:app_busca_cep_flutter/model/via_cep_model.dart';
import 'package:app_busca_cep_flutter/repositories/cep_back4app_repository.dart';
import 'package:app_busca_cep_flutter/repositories/via_cep_repository.dart';
import 'package:app_busca_cep_flutter/shared/widget/custom_drawer.dart';
import 'package:app_busca_cep_flutter/shared/widget/text_form_widget.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController localidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController regiaoController = TextEditingController();
  var cep = "";
  var logradouro = "";
  var complemento = "";
  var unidade = "";
  var bairro = "";
  var uf = "";
  var localidade = "";
  var estado = "";
  var regiao = "";
  var ibge = "";
  var ddd = "";
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();
  var cepBack4appRepository = CepBack4appRepository();
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Consulta", style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FaIcon(
                FontAwesomeIcons.mapLocationDot,
                size: 60,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                "CONSULTA DE CEP",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 115),
              child: TextField(
                inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                  )),
                ),
                keyboardType: TextInputType.number,
                controller: cepController,
                onChanged: (String value) async {
                  setState(() {
                    loading = true;
                  });
                  cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    viaCepModel = await viaCepRepository.buscarCEP(cep);
                  }

                  logradouroController.text = viaCepModel.logradouro ?? "";
                  localidadeController.text = viaCepModel.localidade ?? "";
                  bairroController.text = viaCepModel.bairro ?? "";
                  estadoController.text = viaCepModel.estado ?? "";
                  regiaoController.text = viaCepModel.regiao ?? "";

                  setState(() {
                    loading = false;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            customTextFormField(controller: cepController, labelText: "CEP"),
            customTextFormField(
                controller: logradouroController, labelText: "Logradouro"),
            customTextFormField(
                controller: localidadeController, labelText: "Localidade"),
            customTextFormField(
                controller: bairroController, labelText: "Bairro"),
            customTextFormField(
                controller: estadoController, labelText: "Estado"),
            customTextFormField(
                controller: regiaoController, labelText: "Região"),
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    foregroundColor: const Color.fromARGB(255, 252, 248, 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  var exists = await cepBack4appRepository
                      .verificarCep(cepController.text);
                  if (exists) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("CEP já cadastrado no sistema!")));
                  } else {
                    var register =
                        await cepBack4appRepository.cadastrarCep(viaCepModel);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(register
                            ? "CEP Cadastrado"
                            : "Erro ao cadastrar CEP")));
                  }
                  cepController.text = "";
                  logradouroController.text = "";
                  localidadeController.text = "";
                  bairroController.text = "";
                  estadoController.text = "";
                  regiaoController.text = "";
                },
                child: Text(
                  "CADASTRAR",
                  style: TextStyle(fontWeight: FontWeight.w900),
                )),
            if (loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    ));
  }
}
