import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mytagcall/calllog/call_log_screen.dart';
import 'package:mytagcall/constant/constant.dart';
import 'package:mytagcall/screens/activationcode/activation_code_screen.dart';
import 'package:mytagcall/screens/home/home_screen.dart';
import 'package:mytagcall/screens/messagealert/message_alert_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkcompleteregistercreen();
    checkcompletemessagetypescreen();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ischeckcompletemessagetypescreen == true
                  ? const CallLogScreen()
                  : ischeckcompleteregisterscreen == true
                      ? const MessageAlertScreen()
                      : isAppFlowViaHome
                          ? const HomeScreen()
                          : const ActivationCodeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/bgone.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assest/appicon.png"),
              sizedboxh(100.0),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
