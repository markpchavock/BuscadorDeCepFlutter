import 'package:flutter/material.dart';

Widget customTextFormField(
    {required TextEditingController controller, required String labelText}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
    child: Column(
      children: [
        TextFormField(
            controller: controller,
            enabled: false,
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                border: OutlineInputBorder(),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2.0,
                        color: const Color.fromARGB(255, 4, 134, 241)))),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ],
    ),
  );
}
