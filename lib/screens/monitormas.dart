import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/monitors.dart';
import 'package:v4s/providers/monitors_provaider.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class MoinitorFormScreen extends StatefulWidget {
  const MoinitorFormScreen({Key? key}) : super(key: key);

  @override
  State<MoinitorFormScreen> createState() => _MoinitorFormScreen();
}

enum Categorias { Sansung, Aoc, LG }

class _MoinitorFormScreen extends State<MoinitorFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtMonitorId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtimagen = TextEditingController();
  Categorias? _catSeleccion = Categorias.Sansung;
  bool? _estadoActivo = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
    final Carritoprovider = Provider.of<ProductoProvider>(context);

    // RECIBIENDO EL PRODUCTO POR ARGUMENTO
    final Monitor? procesador =
        ModalRoute.of(context)!.settings.arguments as Monitor?;
    if (!formModificado) {
      if (procesador != null) {
        //Editar procesador
        txtMonitorId.text = procesador.idd.toString();
        txtDescripcion.text = procesador.descripcion;
        txtPrecio.text = procesador.precio.toString();
        txtimagen.text = procesador.imagen;
        print(procesador.categoria);
        if (procesador.categoria == 'categorias.Sansung') {
          _catSeleccion = Categorias.Sansung;
        } else {
          _catSeleccion = Categorias.Aoc;
        }
        _catSeleccion = Categorias.LG;
      } else {
        //Nuevo procesador
        txtMonitorId.text = '0';
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
                controller: txtMonitorId,
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
              const SizedBox(
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
                    labelText: 'imagen',
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
                      value: Categorias.Sansung,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('Samsung'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categorias.Aoc,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('AoC'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categorias.LG,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                          formModificado = true;
                        });
                      }),
                  Text('LG'),
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
                      var monitor = Monitor(
                        id: '',
                        idd: int.parse(txtMonitorId.text),
                        imagen: txtimagen.text,
                        descripcion: txtDescripcion.text,
                        precio: int.parse(txtPrecio.text),
                        categoria: _catSeleccion.toString(),
                      );

                      Carritoprovider.saveProducto(monitor);

                      Navigator.pushReplacementNamed(context, 'monitor');
                    }
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
