import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String)? onChanged;
  const AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.onTap,
      this.isPassword = false,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      style: Styles.w400(size: 14, color: const Color.fromRGBO(33, 31, 31, 1)),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.w400(
          size: 14,
          color: const Color.fromRGBO(172, 172, 172, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(117, 200, 79, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(221, 230, 240, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(117, 200, 79, 1),
          ),
        ),
        suffixIcon: isPassword
            ? InkWell(
                onTap: onTap,
                child: Icon(
                  obscureText!
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
