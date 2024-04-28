part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

 class PhoneAuthInitial extends PhoneAuthState {}

 class Loading extends PhoneAuthState {}

 class Error extends PhoneAuthState {
  final String error;
  Error({required this.error});
}

class PhoneNumSumbit extends PhoneAuthState {}

class   PhoneOTPVerified extends PhoneAuthState {}
