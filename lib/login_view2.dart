import 'package:flutter/material.dart';
import 'package:sesion1/home.dart';
import 'package:sesion1/home2.dart';

class LoginView2 extends StatefulWidget {
  const LoginView2({super.key});

  @override
  State<LoginView2> createState() => _LoginView2State();
}

class _LoginView2State extends State<LoginView2> {
  String selectedCompany = '';
  bool showPassword = false;
  bool rememberMe = false;
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
                colors: [Colors.green, Colors.blue])),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                          value: 'Dynamicall', child: Text('Dynamicall')),
                    ],
                    onChanged: (_) {}),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
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
              TextField(
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
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ))),
              ),
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
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Home2()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          primary: Colors.white),
                      child: Text('Iniciar sesión')))
            ],
          ),
        ),
      ),
    );
  }
}
