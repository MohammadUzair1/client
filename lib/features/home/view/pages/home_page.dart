import 'package:client/core/theme/app_pallette.dart';
import 'package:client/core/widgets/music_slab.dart';
import 'package:client/features/home/view/pages/library_page.dart';
import 'package:client/features/home/view/pages/songs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int selectedIndex = 0;

  List<Widget> pages = const [
    SongsPage(),
    LibraryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],
          Positioned(
            bottom: 0,
            child: MusicSlab(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_unfilled.png',
              color: Pallete.inactiveBottomBarItemColor,
            ),
            activeIcon: Image.asset(
              'assets/images/home_filled.png',
              color: Pallete.whiteColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/library.png',
              color: Pallete.inactiveBottomBarItemColor,
            ),
            activeIcon: Image.asset(
              'assets/images/library.png',
              color: Pallete.whiteColor,
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
