import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:chit_vendor/src/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool rememberMe = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final model = ref.read(loginProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
              const SizedBox(height: 40),
              Text(
                'Sign in',
                style: Styles.w600(size: 32, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('Email Address',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _emailController,
                hintText: 'Enter your email address',
                onChanged: (p0) {
                  setState(() {});
                },
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
                onChanged: (p0) {
                  setState(() {});
                },
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        }),
                  ),
                  const SizedBox(width: 10),
                  Text('Remember me',
                      style: Styles.w400(
                          size: 14,
                          color: const Color.fromRGBO(51, 51, 51, 1))),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgotPassword');
                      },
                      child: Text('Forgot Password?',
                          style: Styles.w400(size: 14, color: primaryText)))
                ],
              ),
              const SizedBox(height: 30),
              AppButton(
                text: 'Sign in',
                loading: state.loading,
                active: _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty,
                onTap: () {
                  model.loginUser(
                      _emailController.text, _passwordController.text, context);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ',
                      style: Styles.w400(
                          size: 14,
                          color: const Color.fromRGBO(51, 51, 51, 1))),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text('Sign up',
                          style: Styles.w400(size: 14, color: secondaryColor)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
