import 'package:flutter/material.dart';

class prueba extends StatelessWidget {
  const prueba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Image.network('assets/ajustes.png'),
      ]),
    );
  }
}
