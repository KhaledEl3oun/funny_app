import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_app/core/businessLogic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:funny_app/core/components/custom_button.dart';
import 'package:funny_app/core/components/header.dart';
import 'package:funny_app/core/utils/appColors.dart';
import 'package:funny_app/features/authentcation/widget/showIndicator.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  late String phoneNumber;
  LoginScreen({super.key});

  final TextEditingController _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _register(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    }
    Navigator.pop(context);
    _formKey.currentState!.save();
    BlocProvider.of<PhoneAuthCubit>(context).sumbitPhoneNumber(phoneNumber);
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
        if (state is PhoneNumSumbit) {
          Navigator.pop(context);
          GoRouter.of(context).go('/otpRoute');
        }
        if (state is Error) {
          Navigator.pop(context);
          String error = (state).error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgImg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const header(text: 'Please Enter Your Phone Number'),
                    const Gap(10),
                    TextFormField(
                      
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Please enter your phone number";
                        } else if (v.length < 11) {
                          return 'Too short for a phone number';
                        }
                        return null;
                      },
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: appColors.bottonColor,
                        filled: true,
                        hintText: '011 234 567 89',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSaved: (value) {
                        phoneNumber = value!;
                      },
                    ),
                    const Gap(100),
                    customButton(
                      onPressed: () {
                        showIndicator(context);
                        _register(context);
                      },
                      text: 'Register',
                    ),
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
