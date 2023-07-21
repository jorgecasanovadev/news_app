import 'package:flutter/material.dart';
import 'package:news_app/src/ui/themes/themes.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;

  const CustomBottomNavBar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: black,
      unselectedItemColor: black38,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(left: 40),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              icon: const Icon(Icons.home, size: 25),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => Navigator.pushNamed(context, '/discover'),
            icon: const Icon(Icons.search, size: 25),
          ),
          label: 'Search',
        ),
        // BottomNavigationBarItem(
        //   icon: Container(
        //     margin: const EdgeInsets.only(right: 40),
        //     child: IconButton(
        //       onPressed: () {
        //         log('no profile screen yet');
        //       },
        //       icon: const Icon(Icons.person),
        //     ),
        //   ),
        //   label: 'Profile',
        // ),
      ],
    );
  }
}
