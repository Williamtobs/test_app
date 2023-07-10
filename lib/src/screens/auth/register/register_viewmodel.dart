import 'package:chit_vendor/src/model/user.dart';
import 'package:chit_vendor/src/screens/auth/register/register.dart';
import 'package:chit_vendor/src/shared/bottom_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel() : super(RegisterState.initial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(String email, String password, BuildContext context,
      String phone, List interest, String name, String username) async {
    try {
      state = state.copyWith(loading: true);

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = _auth.currentUser!;
      await user.sendEmailVerification();
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'email': email,
        'phone': phone,
        'interest': interest,
        'name': name,
        'username': username,
        'id': _auth.currentUser!.uid,
      });
      // ignore: use_build_context_synchronously
      AppBottomModal.showBottomModal(context, const AccountCreated());
      state = state.copyWith(
        loading: false,
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(loading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
      rethrow;
    } catch (e) {
      state = state.copyWith(loading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong!'),
        ),
      );
      rethrow;
    }
  }
}

class RegisterState {
  final bool loading;
  final Users? user;

  RegisterState({
    required this.loading,
    required this.user,
  });

  factory RegisterState.initial() {
    return RegisterState(
      loading: false,
      user: Users.fromJson({}),
    );
  }

  RegisterState copyWith({
    bool? loading,
    Users? user,
  }) {
    return RegisterState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
    );
  }
}
