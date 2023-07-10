import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/screens/onboarding/widgets/onboard_slide.dart';
import 'package:chit_vendor/src/shared/plainbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthOption extends StatelessWidget {
  const AuthOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          OnboardingSlides(
            image: '${imageDir}slide4.png',
            title: 'TRUSTED BY MILLIONS!',
            description:
                "Join the millions who trust our Fintech solutions. Secure, reliable, and innovative - we've got you covered. Experience the future of finance, today.",
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(6, 78, 59, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
          //   AppButton(
          //     text: 'Register',
          //     onTap: () {},
          //   ),
          // ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PlainAppButton(
              text: 'Login',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          )
        ],
      ),
    );
  }
}
