import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class AuthService{
  final FirebaseAuth _authService = FirebaseAuth.instance;

  Future sendOTP(String phoneNumber, BuildContext context, Function setData) async {
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification has been Completed");  
    }

    verificationFailed(FirebaseAuthException exception) {
      Navigator.pop(context);
      showSnackBar(context, exception.toString());
    }

    codeSent(String verificationID, [int? forceResnedingtoken]) {
      showSnackBar(context, "Verification Code sent on the phone number");
      setData(verificationID);
    }

    codeAutoRetrievalTimeout(String verificationID) {
      //Navigator.pop(context);
      showSnackBar(context, "Time out");
    }

    try{
      await _authService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
      );
    } 
    catch(e){
      print(e);
    }
  }

  Future<void> signInWithPhone({
    required String verificationId, required String smsCode})async{

    try{
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode
      );

      await _authService.signInWithCredential(credential);
    }
    catch(e){
      print(e);
    }
  }

  Future signOut()async{
    try{
      await _authService.signOut();
    }
    catch(e){
      print(e);
    }
  }
}