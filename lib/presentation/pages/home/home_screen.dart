import 'package:demo/core/colors.dart';
import 'package:demo/core/constants.dart';
import 'package:demo/data/dummy_json.dart';
import 'package:demo/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class UserInfoTileWidget extends StatelessWidget {
  const UserInfoTileWidget({
    Key? key,
    required this.dSize,
    required this.imageUrl,
    required this.username,
    required this.email,
  }) : super(key: key);

  final Size dSize;
  final String imageUrl;
  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBlack.withOpacity(.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: dSize.width,
      height: dSize.height * .09,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 55,
                height: 55,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object _, StackTrace? __) => const Icon(
                    Icons.person,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        username,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: kBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        email,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 42, 42, 42),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
