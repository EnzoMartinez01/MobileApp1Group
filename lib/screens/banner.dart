import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class banner extends StatelessWidget {
  const banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        children: <Widget>[
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/monitor_1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Monitores',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'monitor');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child:
                        Image.asset('images/procesadores_api.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Procesadores',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'procesador');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/case_1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Gabinetes',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'beta');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/ram_1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Memorias Ram',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'beta');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/ssd-1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Almacenamiento',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'beta');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/video_1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Tarjetas de Video',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'beta');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/perifericos_1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Perifericos',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'beta');
            },
          ),
          CupertinoButton(
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8A71BA),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('images/fuente_1.png', width: 121),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Text(
                      'Fuente de poder',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'beta');
            },
          ),
        ],
      ),
    );
  }
}
