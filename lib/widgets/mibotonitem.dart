import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mibotonitem extends StatelessWidget {
  const mibotonitem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3e5f8a),
      child: SafeArea(
        child: Row(children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    child: Image.asset('images/casa.png', width: 40),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'principal');
                    })
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    child: Image.asset('images/favorito.png', width: 40),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'ruta_reportecarrito');
                    }),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    child: Image.asset('images/carrito.png', width: 40),
                    onPressed: () { Navigator.pushReplacementNamed(context, 'ruta_carrito');}),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                    child: Image.asset('images/user.png', width: 40),
                    onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CupertinoButton(
                  child: Image.asset('images/ajustes.png', width: 40),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'banner');
                  }),
            ]),
          ),
        ]),
      ),
    );
  }
}
