import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/procesadors.dart';
import 'package:v4s/providers/procesadors_provaider.dart';
import 'package:v4s/search/procesador_search_delegate.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class proprocesador extends StatelessWidget {
  const proprocesador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productoProvider2 = Provider.of<ProductoProvider2>(context);
    final List<Procesador> listaProcesador = productoProvider2.listaProcesador;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Virtual4store'),
        backgroundColor: Color(0xff181d3b),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProcesadorSearchDelegate(listaProcesador),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.6,
                child: Swiper(
                  itemCount: listaProcesador.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: size.width * 0.8,
                  itemBuilder: (BuildContext context, int index) {
                    return _cardProcesador(listaProcesador[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Color(0xffcc979f),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.graphic_eq),
            label: "Consultar",
            onTap: () {
              Navigator.pushReplacementNamed(context, 'reporteprocesador');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Color(0xffcc979f),
            label: "Agregar",
            onTap: () {
              Navigator.pushReplacementNamed(context, 'masprocesador');
            },
          ),
        ],
      ),
    );
  }
}

class _cardProcesador extends StatelessWidget {
  final Procesador procesador;
  _cardProcesador(this.procesador);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 25, left: 20, right: 0),
      width: double.infinity,
      height: size.height * 0.5,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _Baseimg(procesador),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Color(0xffcc979f)),
            child: ListTile(
              title: Text(
                procesador.descripcion,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                'S/.' + procesador.precio.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Color(0xfff6d98f),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'masprocesador',
                      arguments: procesador);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Baseimg extends StatelessWidget {
  final Procesador procesador;
  _Baseimg(this.procesador);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 300,
        margin: EdgeInsets.only(bottom: 50),
        child: FadeInImage(
          placeholder: NetworkImage(
              'https://cdn.dribbble.com/users/1186261/screenshots/3718681/_______.gif'),
          image: NetworkImage(procesador.imagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
