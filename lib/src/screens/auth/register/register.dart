import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:chit_vendor/src/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool obscureText = true;
  bool iAgree = false;
  List interests = [];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerProvider);
    final model = ref.read(registerProvider.notifier);

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
              const SizedBox(height: 30),
              Text(
                'Create Account',
                style: Styles.w600(size: 32, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('First Name',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _firstNameController,
                hintText: 'Enter your your first name',
              ),
              const SizedBox(height: 20),
              Text('Last Name',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _lastNameController,
                hintText: 'Enter your your last name',
              ),
              const SizedBox(height: 20),
              Text('Email Address',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _emailController,
                hintText: 'Enter your email address',
              ),
              const SizedBox(height: 20),
              Text('Phone Number',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _phoneController,
                hintText: 'Enter your phone number',
              ),
              const SizedBox(height: 20),
              Text('Create Password',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _passwordController,
                hintText: 'Create your password',
                obscureText: obscureText,
                isPassword: true,
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Interests',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              Wrap(spacing: 10, runSpacing: 10, children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      interests.contains('football')
                          ? interests.remove('football')
                          : interests.add('football');
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: interests.contains('football')
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: interests.contains('football')
                            ? Colors.transparent
                            : primaryColor,
                      ),
                    ),
                    child: Text(
                      'Football',
                      style: Styles.w400(
                          size: 14,
                          color: interests.contains('football')
                              ? Colors.white
                              : primaryText),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      interests.contains('basketball')
                          ? interests.remove('basketball')
                          : interests.add('basketball');
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: interests.contains('basketball')
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: interests.contains('basketball')
                            ? Colors.transparent
                            : primaryColor,
                      ),
                    ),
                    child: Text(
                      'Basketball',
                      style: Styles.w400(
                          size: 14,
                          color: interests.contains('basketball')
                              ? Colors.white
                              : primaryText),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      interests.contains('ice_hockey')
                          ? interests.remove('ice_hockey')
                          : interests.add('ice_hockey');
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: interests.contains('ice_hockey')
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: interests.contains('ice_hockey')
                            ? Colors.transparent
                            : primaryColor,
                      ),
                    ),
                    child: Text(
                      'Ice Hockey',
                      style: Styles.w400(
                          size: 14,
                          color: interests.contains('ice_hockey')
                              ? Colors.white
                              : primaryText),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Checkbox(
                      value: iAgree,
                      onChanged: (value) {
                        setState(() {
                          iAgree = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'I agree to the ',
                    style: Styles.w400(size: 14, color: primaryText),
                  ),
                  Text(
                    'privacy policy ',
                    style: Styles.w400(size: 14, color: secondaryColor),
                  ),
                  Text(
                    'and ',
                    style: Styles.w400(size: 14, color: primaryText),
                  ),
                  Text(
                    'termx of use',
                    style: Styles.w400(size: 14, color: secondaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppButton(
                text: 'Create Account',
                active: iAgree,
                loading: state.loading,
                onTap: () {
                  model.registerUser(
                      _emailController.text,
                      _passwordController.text,
                      context,
                      _phoneController.text,
                      interests,
                      "${_firstNameController.text} ${_lastNameController.text}",
                      _firstNameController.text);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: Styles.w400(size: 14, color: primaryText),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Sign In',
                      style: Styles.w400(size: 14, color: secondaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountCreated extends StatelessWidget {
  const AccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          '${imageDir}email_sent.gif',
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 20),
        Text(
          'Account Created Succefully',
          style: Styles.w600(size: 18, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          'Verify your account by clicking the link in your mail ',
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
