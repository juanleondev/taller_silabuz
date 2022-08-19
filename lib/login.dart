import 'package:flutter/material.dart';

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
                color: Colors.red,
                child: Image.asset(
                  'assets/silabuz_login_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(height: 500, child: FormComponent())),
          ],
        ),
      ),
    );
  }
}

class FormComponent extends StatelessWidget {
  const FormComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Sign in',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Email'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
                width: 335,
                height: 40,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('Sign in'))),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(onPressed: () {}, child: Text('Forgot password?')),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dont have an account'),
              TextButton(onPressed: () {}, child: Text('Sign up')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
