import 'package:flutter/material.dart';
import 'package:sesion1/home2.dart';
import 'package:sesion1/login.dart';
import 'package:sesion1/login_view2.dart';
import 'package:provider/provider.dart';
import 'package:sesion1/user_provider.dart';

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
      bool isTokenValid = await context.read<UserProvider>().isTokenValid();
      if (isTokenValid) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home2()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LoginView2()));
      }
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
