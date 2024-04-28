import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_app/core/businessLogic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:funny_app/core/components/custom_button.dart';
import 'package:funny_app/core/components/header.dart';
import 'package:funny_app/core/utils/appColors.dart';
import 'package:funny_app/features/authentcation/widget/showIndicator.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otpScreen extends StatelessWidget {
  final phoneNumber;
  otpScreen({
    super.key,
    required this.phoneNumber,
  });

  late String otpCode;
  FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).otpSumbit(otpCode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showIndicator(context);
        }
        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          GoRouter.of(context).go('/homeRoute');
        }
        if (state is Error) {
          Navigator.pop(context);
          String error = (state).error;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(error),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ));
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bgImg.jpg'),
                      fit: BoxFit.cover)),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code numbers sent to ',
              style: TextStyle(color: Colors.black, fontSize: 18, height: 1.4),
              children: <TextSpan>[
                TextSpan(
                  text: '$phoneNumber',
                  style: TextStyle(color: Colors.blue),
                ),
                 ],
            ),
                   ),
                    const Gap(10),
                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        // color: Color.fromARGB(255, 255, 132, 132),
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          inactiveFillColor: appColors.bottonColor,
                          selectedFillColor: Colors.white,
                          activeColor: appColors.bottonColor,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          borderWidth: 0,
                          inactiveBorderWidth: 0),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      //   errorAnimationController: errorController,
                      //  controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (code) {
                        otpCode = code;
                      },

                      onChanged: (value) {
                        print(value);
                      },
                   
                    ),
                    const Gap(100),
                    customButton(
                        onPressed: () {
                          showIndicator(context);
                          _login(context);
                        },
                        text: 'Register')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
