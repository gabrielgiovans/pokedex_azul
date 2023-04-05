import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokeNavBar extends StatelessWidget {
  const PokeNavBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _tabController.index,
      onTap: (index) {
        _tabController.index = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/pokedex.svg', height: 30),
          label: 'Capturable',
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/icons/open-pokeball.png', height: 35),
          icon: Image.asset(
            'assets/icons/pokeball.png',
            height: 35,
          ),
          label: 'Captured',
        )
      ],
    );
  }
}
