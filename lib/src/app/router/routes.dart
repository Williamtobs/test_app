import 'package:chit_vendor/src/screens/auth/auth_option.dart';
import 'package:chit_vendor/src/screens/auth/login/login_view.dart';
import 'package:chit_vendor/src/screens/auth/password_reset/new_password.dart';
import 'package:chit_vendor/src/screens/auth/password_reset/reset_password.dart';
import 'package:chit_vendor/src/screens/auth/register/register.dart';
import 'package:chit_vendor/src/screens/dashboard/dashboard.dart';
import 'package:chit_vendor/src/screens/onboarding/splash_screen.dart';
import 'package:chit_vendor/src/screens/tabs/home.dart';
import 'package:chit_vendor/src/screens/tabs/profile/change_password.dart';
import 'package:chit_vendor/src/screens/tabs/profile/update_email.dart';
import 'package:chit_vendor/src/screens/tabs/profile/update_username.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  // static String initialRoute = '/';
  // static String onboardingRoute = '/onboarding';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/authOption':
        return MaterialPageRoute(builder: (_) => const AuthOption());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/forgotPassword':
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case '/newPassword':
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const Dashboard());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/changePassword':
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case '/updateEmail':
        return MaterialPageRoute(builder: (_) => const UpdateEmail());
      case '/updateUserName':
        return MaterialPageRoute(builder: (_) => const UpdateUserName());
      // case '/editProfile':
      //   return MaterialPageRoute(builder: (_) => const EditProfile());
      // case '/savedStudio':
      //   return MaterialPageRoute(builder: (_) => const SavedStudio());
      // case '/changePassword':
      //   return MaterialPageRoute(builder: (_) => const ChangePassword());

      //To Fixxxx here
      // case '/dashboard':
      //   return MaterialPageRoute(builder: (_) => const DashboardScreen());
      // case '/profile':
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case '/settings':
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());
      // case '/about':
      //   return MaterialPageRoute(builder: (_) => const AboutScreen());
      // case '/help':
      //   return MaterialPageRoute(builder: (_) => const HelpScreen());
      // case '/logout':
      //   return MaterialPageRoute(builder: (_) => const LogoutScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Center(
                  child: Text('No route defined for ${settings.name}'),
                ));
    }
  }
}
