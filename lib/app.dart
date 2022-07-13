import 'package:demo/core/colors.dart';
import 'package:demo/presentation/login/screens/user_login_screen.dart';
import 'package:demo/presentation/pages/landing_page/landing_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBlack,
          )),
      home: const UserLoginScreen(),
      routes: {
        'main': (context) => const LandingScreen(),
        'login': (context) => const UserLoginScreen(),
      },
    );
  }
}
