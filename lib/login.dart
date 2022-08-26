import 'package:flutter/material.dart';
import 'package:sesion1/home.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Image.asset(
                  'assets/silabuz_login_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(height: 500, child: FormComponent())),
          ],
        ),
      ),
    );
  }
}

class FormComponent extends StatefulWidget {
  const FormComponent({Key? key}) : super(key: key);

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  TextEditingController emailTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sign in',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailTEC,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
                width: 335,
                height: 40,
                child: Theme(
                    data: ThemeData(primarySwatch: Colors.red),
                    child: ButtonLogin())),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(onPressed: () {}, child: const Text('Forgot password?')),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dont have an account'),
              TextButton(onPressed: () {}, child: const Text('Sign up')),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        onPressed: () {
          // if (emailTEC.text == '') {
          //   print('No se puede acceder');
          // } else {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (_) => HomeView()));
          // }
        },
        child: const Text('Sign in'));
  }
}
