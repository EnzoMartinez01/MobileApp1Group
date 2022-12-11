import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/usuario.dart';
import 'package:v4s/providers/usuarioprovider.dart';

class LoginScreen extends StatefulWidget {
  
  @override
  createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtUser = TextEditingController();
  final txtPass = TextEditingController();
  var passvisible=true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('././images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 350,
                  child: Image.asset('././images/loginn.png', width: 300),
                ),
                registro(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registro() {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: <Widget>[
            TextFormField(
              obscureText: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: '',
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.person)),
              controller: txtUser,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Pot favor ingresa un usuario';
                }
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: passvisible,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '***',
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      passvisible= !passvisible;
                    });
                  },
                  child: passvisible
                    ? const Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                      )
                    : const Icon(
                      Icons.visibility,
                      ),
                  ),
                ),
              controller: txtPass,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'La contraseña debe tener como minimo 5 caracteres';
                } else {
                  return null;
                }
              },
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: const Text(
                  'INGRESAR',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Validando...'),
                      backgroundColor: Colors.blueAccent,
                    ));
                    var encontrado=0; 
                    listaUsuarios.forEach((usuario) {
                      if(usuario.correo==txtUser.text){
                        if(usuario.contra==txtPass.text){
                          encontrado=encontrado+1;
                        }
                      }
                    });
                    //validar
                    if (encontrado>0) {
                      Navigator.pushReplacementNamed(context, 'principal');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Credencias incorrectas...'),
                        backgroundColor: Colors.blueAccent,
                      ));
                    }
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No tienes una cuenta?"),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, 'ruta_registro_login');
                  },
                  child: Text("Regístrate"),
                  textColor: Colors.purple[900],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}