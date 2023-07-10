import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/changePassword');
                },
                child: const EachOption(
                    title: 'Change Password', icon: Icons.lock)),
            const SizedBox(height: 10),
            //update email
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/updateEmail');
                },
                child:
                    const EachOption(title: 'Update Email', icon: Icons.email)),
            const SizedBox(height: 10),
            //update username
            const EachOption(title: 'Update Username', icon: Icons.person),
            //logout
            const SizedBox(height: 10),
            InkWell(
                onTap: () {
                  // User currentUser = FirebaseAuth.instance.currentUser!;
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Logged out successfully!'),
                    ),
                  );
                },
                child: const EachOption(title: 'Logout', icon: Icons.logout)),
          ],
        ),
      ),
    );
  }
}

class EachOption extends StatelessWidget {
  final String title;
  final IconData icon;
  const EachOption({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(title, style: Styles.w600(size: 16)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 15),
        ],
      ),
    );
  }
}
