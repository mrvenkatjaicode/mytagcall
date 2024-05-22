import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../otp/otp_screen.dart';

class LoginScreenProvider extends ChangeNotifier {
  bool showsigninloadingicon = false;

  TextEditingController signinphonenumbercontroller = TextEditingController();

  changeboolvalue() {
    showsigninloadingicon = true;
    notifyListeners();
  }

  validatephonenumber(mobilenumber, context) {
    if (signinphonenumbercontroller.text.isEmpty) {
      snackbar("Enter Mobile Number", redcolor, context);
    } else if (signinphonenumbercontroller.text.length < 10) {
      snackbar("Enter valid Mobile Number", redcolor, context);
    } else {
      sendotp(mobilenumber, context);
    }
  }

  sendotp(String mobilenumber, context) async {
    showsigninloadingicon = true;
    phonenumber = mobilenumber;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobilenumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        showsigninloadingicon = false;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
        debugPrint(e.message.toString());
        notifyListeners();
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(verificationid: verificationId)),
        );
        showsigninloadingicon = false;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    notifyListeners();
  }
}
