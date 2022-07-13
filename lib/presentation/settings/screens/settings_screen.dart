import 'dart:developer' as dev;
import 'package:demo/presentation/settings/widgets/settings_tile_widget.dart';
import 'package:demo/presentation/settings/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 10,
        ),
        child: Column(
          children: [
            SettingsTileWidget(
              dSize: dSize,
              icon: Icons.person,
              title: 'Account',
              onTap: () => _launchInBrowser(Uri.parse('https://www.facebook.com/')),
            ),
            SettingsTileWidget(
              dSize: dSize,
              icon: Icons.notifications,
              title: 'Notification',
              trailing: SwitchWidget(
                onChanged: _onSwitchChange,
              ),
              onTap: () {},
            ),
            SettingsTileWidget(
              dSize: dSize,
              icon: Icons.question_answer,
              title: 'FAQ',
              onTap: () => _launchInBrowser(Uri.parse('https://www.facebook.com/')),
            ),
            SettingsTileWidget(
              dSize: dSize,
              icon: Icons.phone,
              title: 'Contact us',
              onTap: () => _launchInBrowser(Uri.parse('https://www.facebook.com/')),
            ),
            SettingsTileWidget(
              dSize: dSize,
              icon: Icons.info,
              title: 'About',
              onTap: () => _launchInBrowser(Uri.parse('https://www.facebook.com/')),
            ),
            SettingsTileWidget(
              dSize: dSize,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onSwitchChange(value) {
    isSwichON.value = value;
    //todo
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
  }

  Future<void> _launchInBrowser(Uri url) async {
    try {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }
}
