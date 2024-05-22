import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import 'otp_screen_provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationid});
  final String verificationid;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OtpScreenProvider>(
      create: (context) => OtpScreenProvider(),
      child: Builder(builder: (context) {
        return Consumer<OtpScreenProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter you\nVerification Code",
                        style: TextStyle(
                          fontFamily: "Poppins Bold",
                          fontSize: 28,
                        ),
                      ),
                      sizedboxh(20.0),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: provider.otptextcontrollerone,
                                autofocus: true,
                                focusNode: provider.otptextfocusone,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                onChanged: (value) {
                                  value.length == 1
                                      ? provider.otptextfocustwo.requestFocus()
                                      : FocusScope.of(context).unfocus();
                                },
                                decoration: InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: orangecolor.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: lightcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: provider.otptextcontrollertwo,
                                focusNode: provider.otptextfocustwo,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  value.length == 1
                                      ? provider.otptextfocusthree
                                          .requestFocus()
                                      : provider.otptextfocusone.requestFocus();
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: orangecolor.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: lightcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: provider.otptextcontrollerthree,
                                focusNode: provider.otptextfocusthree,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  value.length == 1
                                      ? provider.otptextfocusfour.requestFocus()
                                      : provider.otptextfocustwo.requestFocus();
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: orangecolor.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: lightcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: provider.otptextcontrollerfour,
                                focusNode: provider.otptextfocusfour,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  value.length == 1
                                      ? provider.otptextfocusfive.requestFocus()
                                      : provider.otptextfocusthree
                                          .requestFocus();
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: orangecolor.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: lightcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: provider.otptextcontrollerfive,
                                focusNode: provider.otptextfocusfive,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  value.length == 1
                                      ? provider.otptextfocussix.requestFocus()
                                      : provider.otptextfocusfour
                                          .requestFocus();
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: orangecolor.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: lightcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: provider.otptextcontrollersix,
                                focusNode: provider.otptextfocussix,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  value.length == 1
                                      ? FocusScope.of(context).unfocus()
                                      : provider.otptextfocusfive
                                          .requestFocus();
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: orangecolor.shade50,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: appcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: lightcolor, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedboxh(20.0),
                      // Text(
                      //   "${provider.minutesRemaining.toString().padLeft(2, '0')} : ${provider.secondsRemaining.toString().padLeft(2, '0')}",
                      //   style: const TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.w700),
                      // ),
                      sizedboxh(20.0),
                      Text(
                        "We sent verification code to your phone number $phonenumber",
                        style: const TextStyle(fontSize: 16),
                      ),
                      sizedboxh(20.0),
                      // InkWell(
                      //   onTap: () {
                      //     provider.sendotp(phonenumber, context);
                      //   },
                      //   child: const Text(
                      //     "Didn't received the code? Send again",
                      //     style: TextStyle(
                      //         fontSize: 16,
                      //         decoration: TextDecoration.underline,
                      //         fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                      sizedboxh(30.0),
                      InkWell(
                        onTap: () {
                          provider.changboolvalue();
                          provider.verifyotp(
                              widget.verificationid,
                              (provider.otptextcontrollerone.text +
                                  provider.otptextcontrollertwo.text +
                                  provider.otptextcontrollerthree.text +
                                  provider.otptextcontrollerfour.text +
                                  provider.otptextcontrollerfive.text +
                                  provider.otptextcontrollersix.text),
                              context);
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: appcolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: provider.showverifyotploadingicon
                                  ? CircularProgressIndicator(color: blackcolor)
                                  : const Text(
                                      "Verify",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
