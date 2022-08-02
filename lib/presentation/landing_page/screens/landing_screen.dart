import 'package:demo/core/colors.dart';
import 'package:demo/presentation/animation_page/screens/animation_screen.dart';
import 'package:demo/presentation/home/screens/home_screen.dart';
import 'package:demo/presentation/landing_page/widgets/bottom_nav_item.dart';
import 'package:demo/presentation/settings/screens/settings_screen.dart';
import 'package:demo/presentation/settings/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/app_theme/app_theme_notifier.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: navBarIndex,
      builder: (BuildContext context, int selectedIndex, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[selectedIndex]),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 15,),
                child: SwitchWidget(
                  onChanged: (value) {
                    isDarkThemeOn.value=!isDarkThemeOn.value;
                    Provider.of<AppTheme>(context,listen: false).changeAppTheme();
                  },
                  valueListenable: isDarkThemeOn,
                ),
              )
            ],
          ),
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              bottomNavBarItem(icon: Icons.home_outlined, label: 'Home'),
              bottomNavBarItem(
                  icon: Icons.category_outlined, label: 'Animation'),
              bottomNavBarItem(icon: Icons.person_outline, label: 'Settings')
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              navBarIndex.value = index;
            },
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
List<String> titles = const ["Home", "Actions", "Settings"];

ValueNotifier<bool> isDarkThemeOn=ValueNotifier(false);