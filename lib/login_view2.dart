import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sesion1/home.dart';
import 'package:sesion1/home2.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:provider/provider.dart';
import 'package:sesion1/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginView2 extends StatefulWidget {
  const LoginView2({super.key});

  @override
  State<LoginView2> createState() => _LoginView2State();
}

class _LoginView2State extends State<LoginView2> {
  String selectedCompany = '';
  bool showPassword = false;
  bool rememberMe = false;
  final form = FormGroup({
    'user': FormControl<String>(validators: [
      Validators.required,
      // Validators.pattern("/\\(?([0-9]{3})\\)?([ .-]?)([0-9]{3})\\2([0-9]{4})/")
    ]),
    'password': FormControl<String>(validators: [Validators.required]),
  });
  @override
  Widget build(BuildContext context) {
    const titleFontSize = TextStyle(color: Colors.white, fontSize: 30);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff0c97ab), Color(0xff03474e)])),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ReactiveForm(
                    formGroup: form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bienvenid@',
                          style: titleFontSize,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Iniciar sesión para continuar',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Empresa',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton<String>(
                              // value: selectedCompany,
                              icon: Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              ),
                              items: [
                                DropdownMenuItem(
                                    value: 'Dynamicall',
                                    child: Text('Dynamicall')),
                              ],
                              onChanged: (_) {}),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ReactiveTextField(
                          formControlName: 'user',
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Debes rellenar este campo',
                            ValidationMessage.pattern: (error) =>
                                'El valor ingresado es incorrecto'
                          },
                          decoration: InputDecoration(
                              labelText: 'Usuario',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PasswordTextField(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Recordar contraseña',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  form.markAllAsTouched();
                                  if (form.valid) {
                                    login(form.control('user').value,
                                        form.control('password').value);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    primary: Colors.white),
                                child: Text(
                                  'Iniciar sesión',
                                  style: TextStyle(color: Colors.black),
                                )))
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Future<void> login(String user, String password) async {
    // [GET] https://api.escuelajs.co/api/v1/products
    final url = Uri.https(
      'api.escuelajs.co',
      'api/v1/auth/login',
    );
    final response =
        await http.post(url, body: {"email": user, "password": password});

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(result['access_token']);
      final storage = FlutterSecureStorage();
      await storage.write(key: '__token__', value: result['access_token']);

      final url2 = Uri.https(
        'api.escuelajs.co',
        'api/v1/auth/profile',
      );
      final response2 = await http.get(url2, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${result['access_token']}',
      });

      Navigator.push(context, MaterialPageRoute(builder: (_) => Home2()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
    }

    // // Consulta a la bd auth
    // // Nos devuelve la informacion del usuario
    // if (user == 'juan2396') {
    //   String name = 'Juan Leon';
    //   String address = 'Calle Margaritas 325';
    //   context.read<UserProvider>().name = name;
    //   context.read<UserProvider>().address = address;
    //   Navigator.push(context, MaterialPageRoute(builder: (_) => Home2()));
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
    // }
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: 'password',
      obscureText: !showPassword,
      decoration: InputDecoration(
          labelText: 'Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                showPassword = !showPassword;
                setState(() {});
              },
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ))),
    );
  }
}
