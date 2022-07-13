import 'package:demo/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormTextFormField extends StatelessWidget {
  const LoginFormTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    this.passField = false,
    required this.validator,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool passField;
  final String? Function(String?)? validator;
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
              validator: validator,
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

ValueNotifier<bool> showPassword = ValueNotifier(false);
