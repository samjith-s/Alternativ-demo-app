import 'package:demo/core/colors.dart';
import 'package:demo/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size dSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: dSize.height,
        child: Stack(
          children: [
            Container(
              height: dSize.height * .5,
              width: dSize.width,
              color: kWhite,
            ),
            Positioned(
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
                    const ConfigurableTitleText(
                      text: 'Sign In',
                    ),
                    kheight40,
                    const ConfigurableTextFormField(
                      label: 'Email address',
                      hint: 'username@gmail.com',
                    ),
                    kheight20,
                    const ConfigurableTextFormField(
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
                    kheight20,
                    SizedBox(
                      width: dSize.width - 60,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const ConfigurableTitleText(
                          text: 'Sign In',
                          color: kWhite,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

ValueNotifier<bool> showPassword = ValueNotifier(false);

class ConfigurableTextFormField extends StatelessWidget {
  const ConfigurableTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    this.passField = false,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool passField;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            bottom: 4,
          ),
          child: Text(
            label,
            style: GoogleFonts.poppins(),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return TextFormField(
              obscureText: value,
              decoration: InputDecoration(
                suffixIcon: passField
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          showPassword.value = !showPassword.value;
                        },
                        icon: Icon(value ? Icons.visibility : Icons.visibility_off),
                      )
                    : const SizedBox(),
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  color: hintColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: primary,
                  ),
                ),
                fillColor: kWhite,
                filled: true,
              ),
            );
          },
        ),
      ],
    );
  }
}

class ConfigurableTitleText extends StatelessWidget {
  const ConfigurableTitleText({
    Key? key,
    required this.text,
    this.color = kBlack,
    this.size = 25,
    this.weight = FontWeight.bold,
  }) : super(key: key);

  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
