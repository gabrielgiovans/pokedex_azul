import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokeDrawer extends StatelessWidget {
  const PokeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Pokedex Azul',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Image.asset(
                  'assets/icons/charmander.png',
                  height: 100,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Modular.to.pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Modular.to.pop();
              Modular.to.pushNamed('/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Modular.to.pop(context);
              Modular.to.pushNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}
