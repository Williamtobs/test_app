import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:chit_vendor/src/app/constants/styles.dart';
import 'package:chit_vendor/src/shared/appbutton.dart';
import 'package:chit_vendor/src/shared/apptextfield.dart';
import 'package:chit_vendor/src/utils/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUserName extends ConsumerStatefulWidget {
  const UpdateUserName({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateUserName> createState() => _UpdateUserNameState();
}

class _UpdateUserNameState extends ConsumerState<UpdateUserName> {
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateUserName() async {
    setState(() {
      loading = true;
    });
    User currentUser = FirebaseAuth.instance.currentUser!;
    print(currentUser.uid);
    await firestore.collection('users').doc(currentUser.uid).update({
      'username': _usernameController.text,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username changed successfully!'),
        ),
      );
    });
    ref.read(loginProvider.notifier).fetchDetails(currentUser);
    setState(() {
      loading = false;
    });
  }

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
                'Change Username',
                style: Styles.w600(size: 32, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('New Username',
                  style: Styles.w400(size: 14, color: primaryText)),
              const SizedBox(height: 5),
              AppTextField(
                controller: _usernameController,
                hintText: 'Enter your username',
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              AppButton(
                text: 'Change Username',
                loading: loading,
                active: _usernameController.text.isNotEmpty,
                onTap: () {
                  updateUserName();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
