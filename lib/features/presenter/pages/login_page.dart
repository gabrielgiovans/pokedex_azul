import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/authentication_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationController _controller = Modular.get();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              Text(
                'Pokedex',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'Azul',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
          Image.asset(
            'assets/icons/snorlax.png',
            height: 250,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await _controller.signInWithGoogleAndGetUser();
              },
              child: const Text('Sign in with Google'),
            ),
          ),
        ],
      ),
    );
  }
}
