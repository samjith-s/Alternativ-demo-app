import 'package:demo/core/colors.dart';
import 'package:demo/core/constants.dart';
import 'package:demo/presentation/login/widgets/configurable_text_widget.dart';
import 'package:demo/presentation/login/widgets/login_field_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: const [
            LoginScreenTopSection(),
            LoginScreenBottonSection(),
          ],
        ),
      ),
    );
  }
}

class LoginScreenBottonSection extends StatelessWidget {
  const LoginScreenBottonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        height: dSize.height * .6,
        width: dSize.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 228, 225, 225),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              child: ConfigurableText(
                text: 'Sign In',
              ),
            ),
            // kheight40,
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginFormTextFormField(
                      validator: (value) {
                        return null;
                      },
                      label: 'Email address',
                      hint: 'username@gmail.com',
                    ),
                    kheight10,
                    LoginFormTextFormField(
                      validator: (value) {
                        return null;
                      },
                      label: 'password',
                      hint: 'As2@1hfl',
                      passField: true,
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forget Password?',
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    kheight10,
                    SizedBox(
                      width: dSize.width - 60,
                      height: dSize.height*.07,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const ConfigurableText(
                          text: 'Sign In',
                          color: kWhite,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class LoginScreenTopSection extends StatelessWidget {
  const LoginScreenTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    return Container(
      height: dSize.height * .5,
      width: dSize.width,
      color: kWhite,
      child: const Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
