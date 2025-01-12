import 'package:app_busca_cep_flutter/pages/cep_cadastrado_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera),
                          title: const Text("Camera"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                            leading: const Icon(Icons.photo),
                            title: const Text("Galeria"),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: FaIcon(
                    FontAwesomeIcons.mapLocation,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                accountName: const Text("Busca CEP"),
                accountEmail: Text("Faça a busca de qualquer CEP no Brasil!")),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.mapLocation,
                      color: Color.fromARGB(255, 0, 0, 10),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("CEP Cadastrado",
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CepCadastradoPage(),
                  ));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
