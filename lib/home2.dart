import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion1/edit_profile.dart';
import 'package:sesion1/user_provider.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: page,
        children: [
          Profile(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
          ),
          Menu()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: page,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            page = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Asistencia'),
            BottomNavigationBarItem(
                icon: Icon(Icons.payments), label: 'Adelanto'),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: 'Crédito'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ' Menú'),
          ]),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Text(context.read<UserProvider>().name ?? 'Valor nulo'),
          Text(context.read<UserProvider>().address ?? 'Valor nulo'),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: FlutterLogo(),
            ),
            Text(context.watch<UserProvider>().name ?? ''),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => EditProfile()));
                },
                child: Text('Editar Perfil')),
          ],
        ),
      ),
    );
  }
}
