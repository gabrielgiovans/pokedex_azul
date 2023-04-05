import 'package:flutter/material.dart';

class PokeBar extends StatelessWidget implements PreferredSizeWidget {
  const PokeBar({super.key, required this.label, this.elevation});
  final String label;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label),
      centerTitle: true,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
