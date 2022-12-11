import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/carrito.dart';
import 'package:v4s/providers/carritoprovider.dart';

class CarritoFormScreen extends StatefulWidget {
  const CarritoFormScreen({Key? key}) : super(key: key);

  @override
  State<CarritoFormScreen> createState() => _CarritoFormScreen();
}

enum Categorias { Periferico, sonido }

class _CarritoFormScreen extends State<CarritoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtProductoId = TextEditingController();
  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtimagen = TextEditingController();
  Categorias? _catSeleccion = Categorias.Periferico;
  bool? _estadoActivo = false;
  bool  carritomod = false;


  @override
  Widget build(BuildContext context) {
    final Carritoprovider = Provider.of<CarritoProvider>(context);
    //RECIBIENDO PRODUCTO ARGUMENTO

final Carrito? carrito = ModalRoute.of(context)!.settings.arguments as Carrito?;
if (!carritomod){
  if (carrito != null){

    txtProductoId.text = carrito.productoId.toString();
    txtDescripcion.text = carrito.descripcion;
    txtPrecio.text = carrito.precio.toString();
    txtimagen.text = carrito.imagen;
    print(carrito.categoria);
    if(carrito.categoria == 'categoria.Perifericos'){
      _catSeleccion = Categorias.Periferico;
    }else{
      _catSeleccion = Categorias.sonido;
    }
  }else{
    txtProductoId.text = '0';
    txtDescripcion.text = '';
    txtPrecio.text = '';
    txtimagen.text = '';
  }
}

   
 return Scaffold(
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
              controller: txtProductoId,
              decoration: InputDecoration(
                labelText:'ProductoId',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)) 
              ),
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
              height: 20,
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
            Row(
              children: <Widget>[
                Text('Categoria'),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: Categorias.Periferico,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                        carritomod = true;
                      });
                    }),
                Text('Perifericos'),
                SizedBox(
                  width: 15,
                ),
                Radio(
                    value: Categorias.sonido,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                        carritomod = true;
                      });
                    }),
                Text('Sonido'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Estado'),
                SizedBox(
                  width: 20,
                ),
                Checkbox(
                    value: _estadoActivo,
                    onChanged: (value) {
                      setState(() {
                        _estadoActivo = value;
                        print('_estadoActivo: ${_estadoActivo}');
                      });
                    }),
                Text('Activo')
              ],
            ),
            Container(
              child: ElevatedButton(
                child: const Text('Seleccionar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Valindado...')));
                    var carrito = Carrito(
                        id: '',
                        productoId:int.parse( txtProductoId.text),
                        descripcion: txtDescripcion.text,
                        precio: int.parse(txtPrecio.text),
                        imagen: txtimagen.text,
                        categoria: _catSeleccion.toString(),
                        estado: _estadoActivo.toString());
                    Carritoprovider.saveProducto(carrito);

                    Navigator.pushReplacementNamed(context, 'ruta_carrito');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
