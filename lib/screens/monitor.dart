import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/monitors.dart';
import 'package:v4s/providers/monitors_provaider.dart';
import 'package:v4s/search/monitor_search_delegate.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class promonitor extends StatelessWidget {
  const promonitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Monitor> listaMonitor = productoProvider.listaMonitor;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Virtual4store'),
        backgroundColor: Color(0xff181d3b),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MonitorSearchDelegate(listaMonitor),
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
                  itemCount: listaMonitor.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: size.width * 0.8,
                  itemBuilder: (BuildContext context, int index) {
                    return _cardMonitor(listaMonitor[index]);
                  },
                ),
              )
              /* Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10),
                  itemCount: listaMonitor.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffc1c1c1), width: 3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/monitores_api.png',
                                width: 110,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                listaMonitor[index].descripcion,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                 "S/. "+listaMonitor[index].precio.toString() ,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              /* ListTile(
                        title: Text(listaMonitor[index].descripcion),
                        subtitle: Text(listaMonitor[index].precio.toString()),
                        onTap: () {},
                      ) */
                              SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Ver Producto'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff3e5f8a),
                                  ))
                            ],
                          )),
                    );
                  },
                ),
              )*/
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0xffcc979f),
        children: [
          SpeedDialChild(
            child: Icon(Icons.graphic_eq),
            label: "Consultar",
            onTap: () {
              Navigator.pushReplacementNamed(context, 'reportemonitor');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Color(0xffcc979f),
            label: "Agregar",
            onTap: () {
              Navigator.pushReplacementNamed(context, 'masmonitor');
            },
          ),
        ],
      ),
    );
  }
}

class _cardMonitor extends StatelessWidget {
  final Monitor monitor;
  _cardMonitor(this.monitor);
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
          _Baseimg(monitor),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Color(0xffcc979f)),
            child: ListTile(
              title: Text(
                monitor.descripcion,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                'S/.' + monitor.precio.toString(),
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
                  Navigator.pushNamed(context, 'masmonitor',
                      arguments: monitor);
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
  final Monitor monitor;
  _Baseimg(this.monitor);
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
          image: NetworkImage(monitor.imagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
