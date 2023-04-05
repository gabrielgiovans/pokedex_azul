import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/authentication_controller.dart';
import '../widgets/poke_bar.dart';
import 'package:pokedex_azul/features/domain/entities/user_entity.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _authenticationController = Modular.get<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    var user = _authenticationController.state;
    return Scaffold(
      appBar: const PokeBar(label: 'Profile'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildUserImage(user),
          Text(
            user.displayName,
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            user.email,
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              _authenticationController.signOut();
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }

  CachedNetworkImage _buildUserImage(UserEntity user) {
    return CachedNetworkImage(
      imageUrl: user.photoUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
