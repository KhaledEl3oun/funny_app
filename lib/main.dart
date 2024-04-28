import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_app/core/appRouter/App_router.dart';
import 'package:funny_app/core/businessLogic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:funny_app/features/authentcation/view/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCg51AWTweYFVM5UQ9fh34oVJ2I2sMTaKk',
          appId: 'com.example.funny_app',
          messagingSenderId: '373454673739',
          projectId: 'funny-app-5152c'));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneAuthCubit(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
