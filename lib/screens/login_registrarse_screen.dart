import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/usuario.dart';
import 'package:v4s/providers/usuarioprovider.dart';

class RegistrologinScreen extends StatefulWidget {
  const RegistrologinScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegistrologinScreen();
}

enum sexo { Masculino, Femenino }

class _RegistrologinScreen extends State<RegistrologinScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtnombre = TextEditingController();
  final txtapellido = TextEditingController();
  final txtCorreo = TextEditingController();
  final txtedad = TextEditingController();
  final txtcontra = TextEditingController();
  final txtrecontra = TextEditingController();
  sexo? _SexoSeleccion = sexo.Masculino;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('././images/fondoreg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Registrarse", style: TextStyle(fontSize: 30)),
                SizedBox(height: 30),
                reg(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reg() {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: '',
                      labelText: 'Nombres',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      suffixIcon: const Icon(Icons.person)),
                  controller: txtnombre,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Coloque sus nombres';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: '',
                      labelText: 'Apellidos',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      suffixIcon: const Icon(Icons.person)),
                  controller: txtapellido,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Coloque sus apellidos';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'usuario@flutter.com',
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      suffixIcon: const Icon(Icons.mail)),
                  controller: txtCorreo,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un correo';
                    }
                    if (EmailValidator.validate(value)) {
                      return null;
                    } else {
                      return 'Ingresa un correo válido';
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '',
                      labelText: 'Edad',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      suffixIcon: const Icon(Icons.date_range_sharp)),
                  controller: txtedad,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa tu edad';
                    } else if (int.parse(value) < 18) {
                      return 'Usted es menor de edad';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('Genero'),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: sexo.Masculino,
                        groupValue: _SexoSeleccion,
                        onChanged: (value) {
                          setState(() {
                            _SexoSeleccion = value as sexo?;
                            print(_SexoSeleccion);
                          });
                        }),
                    Text('Masculino'),
                    SizedBox(
                      width: 15,
                    ),
                    Radio(
                        value: sexo.Femenino,
                        groupValue: _SexoSeleccion,
                        onChanged: (value) {
                          setState(() {
                            _SexoSeleccion = value as sexo?;
                            print(_SexoSeleccion);
                          });
                        }),
                    Text('Femenino'),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: '***',
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      suffixIcon: const Icon(Icons.lock_outline)),
                  controller: txtcontra,
                  validator: (value) {
                    if (value!.length < 5) {
                      return 'La contraseña debe tener minimo 5 caracteres';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: '***',
                      labelText: 'Repita su contraseña',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      suffixIcon: const Icon(Icons.lock_outline)),
                  controller: txtrecontra,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Repite la contraseña';
                    } else if (txtrecontra.text != txtcontra.text) {
                      return 'La contraseña no es igual';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Container(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ElevatedButton(
                    child: const Text('Registrar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (txtnombre.text == '' &&
                            txtCorreo.text == '' &&
                            txtedad.text == '' &&
                            txtcontra.text == '' &&
                            txtrecontra.text == '') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Credencias incorrectas...'),
                            backgroundColor: Colors.blueAccent,
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Su cuenta ha sido creada'),
                            backgroundColor: Colors.blueAccent,
                          ));
                          var usuario = Usuario(
                              id: '',
                              nombre: txtnombre.text,
                              apellidos: txtapellido.text,
                              edad: int.parse(txtedad.text),
                              sexo: _SexoSeleccion.toString(),
                              correo: txtCorreo.text,
                              contra: txtrecontra.text);
                          usuarioProvider.saveUsuario(usuario);
                          Navigator.pushReplacementNamed(context, 'rutalogin');
                        }
                      }
                    },
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Ya tienes una cuenta?"),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'rutalogin');
                      },
                      child: Text("Ingresar"),
                      textColor: Colors.purple,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
