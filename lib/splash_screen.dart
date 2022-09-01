import 'package:flutter/material.dart';
import 'package:sesion1/login.dart';
import 'package:sesion1/login_view2.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Consultas http
      // Consultas a bd local

      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginView2()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()));
      }),
    );
  }
}
