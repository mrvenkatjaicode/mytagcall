import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytagcall/constant/constant.dart';

import '../messagealert/message_alert_screen.dart';

class OtpScreenProvider extends ChangeNotifier {
  TextEditingController otptextcontrollerone = TextEditingController();
  TextEditingController otptextcontrollertwo = TextEditingController();
  TextEditingController otptextcontrollerthree = TextEditingController();
  TextEditingController otptextcontrollerfour = TextEditingController();
  TextEditingController otptextcontrollerfive = TextEditingController();
  TextEditingController otptextcontrollersix = TextEditingController();

  FocusNode otptextfocusone = FocusNode();
  FocusNode otptextfocustwo = FocusNode();
  FocusNode otptextfocusthree = FocusNode();
  FocusNode otptextfocusfour = FocusNode();
  FocusNode otptextfocusfive = FocusNode();
  FocusNode otptextfocussix = FocusNode();

  bool showverifyotploadingicon = false;

  changboolvalue() {
    showverifyotploadingicon = true;
    notifyListeners();
  }

  verifyotp(String verificationid, String otp, context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential phoneauthcredential = PhoneAuthProvider.credential(
        verificationId: verificationid, smsCode: otp);

    var result = await auth.signInWithCredential(phoneauthcredential);
    if (phoneauthcredential.smsCode == otp) {
      setphonenumber();
      debugPrint("success");
      completeregisterscreen();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MessageAlertScreen()),
      );
      showverifyotploadingicon = false;
      //  time.cancel();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Wrong OTP!"),
        ),
      );
    }
    debugPrint(result.toString());
  }
}
