import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            RestaurantCard(
              contador: contador,
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.contador});
  final int contador;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 180,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 99,
                    height: 84,
                    child: FlutterLogo(),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Poke armado',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            'Arroz + chicken lemon pepper + palta, tomate choclo, col morada, mango, chifles +  acevichada de palta, spicy mayo + 2 chifles ...')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 31,
              ),
              Row(
                children: [
                  EditButton(
                    contador: contador,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'S/17.00',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Colors.green,
                      shape: CircleBorder(),
                      child: Icon(Icons.remove),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text('1'),
                  SizedBox(
                    width: 13,
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Colors.green,
                      shape: CircleBorder(),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.contador});
  final int contador;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () {
          print(contador);
        },
        child: Text('Editar'));
  }
}
