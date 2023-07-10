import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:chit_vendor/src/utils/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateEmail extends ConsumerStatefulWidget {
  const UpdateEmail({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends ConsumerState<UpdateEmail> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  updateEmail() {
    setState(() {
      loading = true;
    });
    User currentUser = firebaseAuth.currentUser!;
    firebaseAuth
        .signInWithEmailAndPassword(
            email: ref.read(loginProvider).user!.email,
            password: _passwordController.text)
        .then((value) {
      currentUser.updateEmail(_emailController.text).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email changed successfully!'),
          ),
        );
        FirebaseAuth.instance.signOut();
        setState(() {
          loading = false;
        });
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      });
    });
  }

  bool obscureText = true;
  bool loading = false;
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
                'Change Email Address',
                style: Styles.w600(size: 32, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('New Email Address',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _emailController,
                hintText: 'Enter your email address',
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              Text('Password',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
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
                text: 'Change Email Address',
                loading: loading,
                active: _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty,
                onTap: () {
                  updateEmail();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
