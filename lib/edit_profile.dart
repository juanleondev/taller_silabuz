import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion1/user_provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(context.read<UserProvider>().name);
        context.read<UserProvider>().changeName('Adrian');
        print(context.read<UserProvider>().name);
      }),
    );
  }
}
