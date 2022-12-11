import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class fasebeta extends StatelessWidget {
  const fasebeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Virtual4store'),
        backgroundColor: Color(0xff181d3b),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text(
              'Lo sentimos',
            ),
            Text(
              'pera esta aplicacion todavia se encuentra ',
            ),
            Text(
              'en fase de beta',
            ),
          ],
        ),
      ),
    );
  }
}
