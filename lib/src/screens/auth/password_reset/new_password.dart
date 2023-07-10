import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:chit_vendor/src/shared/bottom_modal.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool obscureText = true;
  bool obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    '${iconDir}color_logo.png',
                    width: 40,
                    height: 35,
                  ),
                  Text(
                    'CHIT',
                    style: Styles.w600(size: 32, color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Reset Password',
              style: Styles.w600(size: 32, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Text('Enter Password',
                style: Styles.w400(size: 14, color: primaryText)),
            const SizedBox(height: 5),
            AppTextField(
              controller: _passwordController,
              hintText: 'Create your password',
              obscureText: obscureText,
              isPassword: true,
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            const SizedBox(height: 20),
            Text('Confirm Password',
                style: Styles.w400(size: 14, color: primaryText)),
            const SizedBox(height: 5),
            AppTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm your password',
              obscureText: obscureText2,
              isPassword: true,
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                setState(() {
                  obscureText2 = !obscureText2;
                });
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              text: 'Change Password',
              active: _passwordController.text.isNotEmpty &&
                  _confirmPasswordController.text.isNotEmpty &&
                  _passwordController.text == _confirmPasswordController.text,
              onTap: () {
                AppBottomModal.showBottomModal(context, const PasswordChange());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          '${imageDir}done.gif',
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 20),
        Text(
          'Password Changed',
          style: Styles.w600(size: 18, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          'Password successfully changed, now login to '
          'continue using your account',
          style: Styles.w400(size: 16, color: primaryText),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        AppButton(
          text: 'Login',
          active: true,
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
        ),
      ],
    );
  }
}
