import 'package:demo/core/colors.dart';
import 'package:demo/presentation/animation_page/screens/animation_screen.dart';
import 'package:demo/presentation/home/screens/home_screen.dart';
import 'package:demo/presentation/landing_page/widgets/bottom_nav_item.dart';
import 'package:demo/presentation/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: navBarIndex,
      builder: (BuildContext context, int selectedIndex, Widget? child) {
        return Scaffold(
          appBar: AppBar(),
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              bottomNavBarItem(icon: Icons.home_outlined, label: 'Home'),
              bottomNavBarItem(icon: Icons.category_outlined, label: 'Animation'),
              bottomNavBarItem(icon: Icons.person_outline, label: 'Settings')
            ],
            backgroundColor: kBlack,
            currentIndex: selectedIndex,
            onTap: (index) {
              navBarIndex.value = index;
            },
            selectedItemColor: kWhite,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: primary),
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}

ValueNotifier<int> navBarIndex = ValueNotifier(0);


List<Widget> pages = const [
  HomeScreen(),
  AnimationScreen(),
  SettingScreen(),
];
