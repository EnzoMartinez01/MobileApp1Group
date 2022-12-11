import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/carrito.dart';
import 'package:v4s/providers/carritoprovider.dart';

import '../widgets/mibotonitem.dart';

class CarritoScreen extends StatefulWidget {
  @override
  createState() => _CarritoScreen();
}

class _CarritoScreen extends State<CarritoScreen> {
  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);
    final List<Carrito> listacarrito = carritoProvider.listacarrito;

    final Size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Carrito de Compras'),
        backgroundColor: Color(0xff181d3b),
      ),
      body:Container(
        width: double.infinity,
        height: Size.height * 0.7,
        color: Colors.white,
        child: Swiper(
          itemCount: listacarrito.length,
          layout: SwiperLayout.STACK,
          itemWidth: Size.width * 0.8,
          itemHeight: Size.height * 0.7,
          itemBuilder: (BuildContext context , int index){
            return _cardCarrito(listacarrito[index]);
          },
          ),
      ) ,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_carrito_form');
        },
        backgroundColor: Color(0xffcc979f),
      ),
    );
  }
}

class _cardCarrito extends StatelessWidget{
  final Carrito carrito;
  _cardCarrito(this.carrito);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 140,bottom: 20),
      
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _ImagenFondo(carrito),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
              ),
              color:  Color(0xff181d3b)

               ),
            child: ListTile(
              title: Text(carrito.descripcion,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              ),
              subtitle: Text(
                'S/.' + carrito.precio.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                  
                ),
        
              ),
              trailing:  IconButton(
                icon:const Icon(Icons.edit,color: Colors.white,),
                onPressed: (){
                  Navigator.pushNamed(context, 'ruta_carrito_form', arguments: carrito
                  );

                }, ),
            ),
            
          )
        ],
      ),

    );
    
  }
}

class _ImagenFondo extends StatelessWidget {
  final Carrito carrito;
  _ImagenFondo(this.carrito);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage(''),
            image:NetworkImage(carrito.imagen),
            fit: BoxFit.cover),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
