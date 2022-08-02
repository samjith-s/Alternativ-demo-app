import 'package:demo/core/colors.dart';
import 'package:demo/presentation/landing_page/screens/landing_screen.dart';
import 'package:demo/presentation/login/screens/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/model/app_theme/app_theme_notifier.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppTheme(),
      child: Consumer<AppTheme>(
        builder: (context,appTheme,_){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: AppTheme.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            home: const UserLoginScreen(),
            routes: {
              'main': (context) => const LandingScreen(),
              'login': (context) => const UserLoginScreen(),
            },
          );
        },
      )
    );
  }
}
