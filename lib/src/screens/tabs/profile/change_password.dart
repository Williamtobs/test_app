import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  bool loading = false;

  changePassword() async {
    setState(() {
      loading = true;
    });
    User currentUser = firebaseAuth.currentUser!;
    await currentUser.updatePassword(_passwordController.text);
    setState(() {
      loading = false;
    });
    FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password changed successfully!'),
      ),
    );
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Change Password',
                style: Styles.w600(size: 32, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('New Password',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _passwordController,
                hintText: 'Change your password',
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
              AppButton(
                text: 'Change Password',
                loading: loading,
                active: _passwordController.text.isNotEmpty,
                onTap: () {
                  changePassword();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
