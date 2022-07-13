import 'package:demo/core/constants.dart';
import 'package:demo/data/dummy_json.dart';
import 'package:demo/data/model/user_model.dart';
import 'package:demo/presentation/home/widgets/user_info_tile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 18,
          ),
          child: ListView.separated(
            itemBuilder: ((context, index) {
              List<User> users = usersData.map((e) => User.fromJson(e)).toList();
              final user = users[index];
              return UserInfoTileWidget(
                dSize: dSize,
                username: user.firstName,
                email: user.email,
                imageUrl: user.avatar,
              );
            }),
            separatorBuilder: ((__, _) => kheight10),
            itemCount: 25,
          ),
        ),
      ),
    );
  }
}
