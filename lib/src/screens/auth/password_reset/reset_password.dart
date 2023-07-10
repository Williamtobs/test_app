import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
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
            Text('Email Address',
                style: Styles.w400(size: 14, color: primaryText)),
            const SizedBox(height: 5),
            AppTextField(
              controller: _emailController,
              hintText: 'princess@chit.io',
              onChanged: (p0) {
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              text: 'Reset Password',
              active: _emailController.text.isNotEmpty,
              onTap: () {
                Navigator.pushNamed(context, '/newPassword');
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Remember Password? ',
                  style: Styles.w400(size: 14, color: primaryText),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Sign in',
                    style: Styles.w600(size: 14, color: primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
