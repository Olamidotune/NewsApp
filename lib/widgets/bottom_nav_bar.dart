import 'package:flutter/material.dart';
import 'package:news/screens/discover_screen.dart';
import 'package:news/screens/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.red,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: IconButton(
           onPressed: () => Navigator.of(context).pushNamed(DiscoverScreen.routeName),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            label: 'Search'),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              print('No profile Screen');
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
