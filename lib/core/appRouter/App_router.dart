import 'package:funny_app/features/authentcation/view/homeScreen.dart';
import 'package:funny_app/features/authentcation/view/login_screen.dart';
import 'package:funny_app/features/authentcation/view/otp_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const initialRoute = '/';
  static const otpRoute = '/otpRoute';
  static const homeRoute = '/homeRoute';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => LoginScreen()),
      GoRoute(
        path: otpRoute,
        builder: (context, state) => otpScreen(phoneNumber: null,)),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => homeScreen())
    ]
    );
}
