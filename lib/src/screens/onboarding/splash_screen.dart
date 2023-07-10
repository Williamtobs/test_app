import 'package:chit_vendor/src/app/constants/app_string.dart';
import 'package:chit_vendor/src/utils/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  User? user;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        ref.read(loginProvider.notifier).fetchDetails(user!);
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        Navigator.pushReplacementNamed(context, '/authOption');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(6, 78, 59, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                '${iconDir}logo.png',
                width: 40,
                height: 35,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'CHIT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
