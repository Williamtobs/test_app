import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:chit_vendor/src/shared/bottom_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool loading = false;

  resetPassword() async {
    setState(() {
      loading = true;
    });
    await firebaseAuth
        .sendPasswordResetEmail(email: _emailController.text)
        .then((value) => {
              setState(() {
                loading = false;
              }),
              AppBottomModal.showBottomModal(context, const PasswordChange())
            })
        .catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${e.message}'),
        ),
      );
      setState(() {
        loading = false;
      });
    });
  }

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
                resetPassword();
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
          'Password Reset',
          style: Styles.w600(size: 18, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          'Password successfully reset, check your email to set a new password',
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
