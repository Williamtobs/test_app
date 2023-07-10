import 'package:chit_vendor/src/screens/auth/login/login_viewmodel.dart';
import 'package:chit_vendor/src/screens/auth/register/register_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
  (ref) => RegisterViewModel(),
);

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(),
);
