import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/procesadors.dart';
import 'package:v4s/providers/procesadors_provaider.dart';
import 'package:v4s/screens/principal.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class ProcesadorFormScreen extends StatefulWidget {
  const ProcesadorFormScreen({Key? key}) : super(key: key);

  @override
  State<ProcesadorFormScreen> createState() => _ProcesadorFormScreen();
}

enum Categorias { Intel, AMD }

class _ProcesadorFormScreen extends State<ProcesadorFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtProcesadorId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtimagen = TextEditingController();
  Categorias? _catSeleccion = Categorias.Intel;
  bool? _estadoActivo = false;
  bool formModificado = false;
  @override
  Widget build(BuildContext context) {
    final Carritoprovider2 = Provider.of<ProductoProvider2>(context);
    // RECIBIENDO EL PRODUCTO POR ARGUMENTO
    final Procesador? procesador =
        ModalRoute.of(context)!.settings.arguments as Procesador?;
    if (!formModificado) {
      if (procesador != null) {
        //Editar procesador
        txtProcesadorId.text = procesador.idd.toString();
        txtDescripcion.text = procesador.descripcion;
        txtPrecio.text = procesador.precio.toString();
        txtimagen.text = procesador.imagen;
        print(procesador.categoria);
        if (procesador.categoria == 'categorias.Intel') {
          _catSeleccion = Categorias.Intel;
        } else {
          _catSeleccion = Categorias.AMD;
        }
      } else {
        //Nuevo procesador
        txtProcesadorId.text = '0';
        txtDescripcion.text = '';
        txtPrecio.text = '';
        txtimagen.text = '';
      }
    }
    return Scaffold(
        bottomNavigationBar: mibotonitem(),
        appBar: AppBar(
          title: Text('REGISTRO DE PRODUCTO'),
          backgroundColor: Color(0xff181d3b),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                readOnly: true,
                controller: txtProcesadorId,
                decoration: InputDecoration(
                    labelText: 'ProcesadorId',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                //maxLines: 8,
                //maxLength: 50,
                decoration: InputDecoration(
                    labelText: 'Descripcion',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtDescripcion,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripcion';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtPrecio,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripcion';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtimagen,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una imagen';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text('Categoria'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Categorias.Intel,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Intel'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categorias.AMD,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('AMD'),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: ElevatedButton(
                  child: const Text('SELECCIONAR'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Valindado...')));
                      var procesador = Procesador(
                        id: '',
                        idd: int.parse(txtProcesadorId.text),
                        descripcion: txtDescripcion.text,
                        precio: int.parse(txtPrecio.text),
                        categoria: _catSeleccion.toString(),
                        imagen: txtimagen.text,
                      );

                      Carritoprovider2.saveProducto(procesador);

                      Navigator.pushReplacementNamed(context, 'procesador');
                    }
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
