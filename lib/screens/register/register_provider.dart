import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mytagcall/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import '../otp/otp_screen.dart';

class ProfileScreenProvider extends ChangeNotifier {
  ProfileScreenProvider() {
    randamnumbergenerate();
    placevaluesintextfield();
  }
  CollectionReference<Map<String, dynamic>> shopProfileRef =
      FirebaseFirestore.instance.collection('profileDetails');

  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();

  bool showprofileloadingicon = false;
  bool agreeterms = false;

  changecheckvalue(value) {
    agreeterms = value ?? false;
    notifyListeners();
  }

  placevaluesintextfield() async {
    await getcompanyname();
    await getusername();
    await getphonenumber();
    await getcity();
    companynamecontroller.text = companyname;
    namecontroller.text = name;
    mobilenumbercontroller.text = phonenumber;
    citycontroller.text = city;
    notifyListeners();
  }

  validatetextfields(context) {
    if (companynamecontroller.text.isEmpty) {
      snackbar("Enter Company Name", redcolor, context);
    } else if (namecontroller.text.isEmpty) {
      snackbar("Enter Name", redcolor, context);
    } else if (mobilenumbercontroller.text.isEmpty) {
      snackbar("Enter Mobile Number", redcolor, context);
    } else if (mobilenumbercontroller.text.length < 10) {
      snackbar("Enter valid Mobile Number", redcolor, context);
    } else if (citycontroller.text.isEmpty) {
      snackbar("Enter City", redcolor, context);
    } else if (agreeterms == false) {
      snackbar("Please agree to the TC & Privacy Policy", redcolor, context);
    } else {
      sendotp("+91${mobilenumbercontroller.text}", context);
    }
  }

  sendotp(String mobilenumber, context) async {
    showprofileloadingicon = true;
    phonenumber = mobilenumber;
    // setState(() {
    //   isloading = true;
    // });
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobilenumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // setState(() {
        //   isloading = false;
        // });
      },
      verificationFailed: (FirebaseAuthException e) {
        showprofileloadingicon = false;

        // setState(() {
        //   isloading = false;
        // });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
        debugPrint(e.message.toString());
        notifyListeners();
      },
      codeSent: (String verificationId, int? resendToken) {
        // setState(() {
        //   isloading = false;
        // });
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => OtpVerifyScreen(
        //             mobileno: mobile,
        //             otptext: mobile,
        //             verificationid: verificationId,
        //           )),
        // );
        saveprofiledetailsfirebase(
            companynamecontroller.text,
            namecontroller.text,
            phonenumber,
            citycontroller.text,
            verificationId,
            context);
        // showprofileloadingicon = false;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    notifyListeners();
  }

  void randamnumbergenerate() {
    var rndnumber = "";
    var rnd = Random();
    for (var i = 0; i < 10; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    userid = rndnumber;
    debugPrint(rndnumber);
    notifyListeners();
  }

  void saveprofiledetailsfirebase(
      companyname, username, mobilenumber, city, verificationid, context) {
    shopProfileRef.doc(mobilenumber).set({
      "userDetails": [
        {
          'userId': userid.toString(),
          'userStatus': "1",
          'adminStatus': "0",
          'messageStatus': "0",
          'profileName': username,
          'companyName': companyname,
          'mobileNumber': mobilenumber,
          'city': city,
          'msgType': "0",
          'msgAlert': "0",
          'createdDate': DateTime.now().toString(),
          'accessCode': "",
          'paymentStatus': "0",
        }
      ]
      // 'shopName': shopname,
      // 'shopPhoneNumber': shopphonenumber,
      // 'shopAddress': shopaddresss,
      // 'shopCreatedDateTime': DateTime.now(),
    }).then((value) {
      // setphonenumber();
      //  shopeName = shopname;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpScreen(verificationid: verificationid)),
      );
      showprofileloadingicon = false;
      debugPrint('Shop profile details saved to Firestore');
      notifyListeners();
    }).catchError((error) {
      debugPrint('Failed to save location: $error');
      showprofileloadingicon = false;
      notifyListeners();
    });
  }

  Future<void> fetchUserData() async {
    await getphonenumber();
    QuerySnapshot querySnapshot =
        await shopProfileRef.doc(phonenumber).collection('userDetails').get();
    List<dynamic> list = [];
    List<String> idlist = [];

    for (var doc in querySnapshot.docs) {
      list.add(json.encode(doc.data()));
      idlist.add(doc.id);
    }

    if (list.isEmpty) {
    } else {}
  }
}
