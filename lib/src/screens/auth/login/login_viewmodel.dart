import 'package:chit_vendor/src/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState.initial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = state.copyWith(loading: true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = _auth.currentUser!;
      if (user.emailVerified == false) {
        state = state.copyWith(loading: false);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please verify your email!'),
          ),
        );
        return;
      } else {
        await fetchDetails(user);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (Route<dynamic> route) => false);
      }
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

  fetchDetails(User user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection('users').doc(user.uid).get();
    state = state.copyWith(
      loading: false,
      user: Users.fromJson({
        'email': doc.data()!['email'],
        'phone': doc.data()!['phone'],
        'interest': doc.data()!['interest'],
        'username': doc.data()!['username'],
        'name': doc.data()!['name'],
        'id': doc.data()!['id'],
      }),
    );
  }
}

class LoginState {
  final bool loading;
  final Users? user;

  LoginState({
    required this.loading,
    required this.user,
  });

  factory LoginState.initial() {
    return LoginState(
      loading: false,
      user: Users.fromJson({}),
    );
  }

  LoginState copyWith({
    bool? loading,
    Users? user,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
    );
  }
}
