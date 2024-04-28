import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_app/core/businessLogic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:funny_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PhoneAuthCubit>(
        create: (context) => phoneAuthCubit,
        child: customButton(
            onPressed: () async {
              await phoneAuthCubit.logOut();
              GoRouter.of(context).go('/');
            },
            text: 'log out'),
      ),
    );
  }
}
