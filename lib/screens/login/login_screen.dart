import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import 'login_screen_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginScreenProvider>(
      create: (context) => LoginScreenProvider(),
      child: Builder(builder: (context) {
        return Consumer<LoginScreenProvider>(
            builder: (context, provider, child) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.05,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedboxh(30.0),
                    Image.asset("assest/signin.png"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Poppins Bold", fontSize: 28),
                        ),
                        Text("Let's login for explore continues",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: greycolor)),
                      ],
                    ),
                    TextFormField(
                      controller: provider.signinphonenumbercontroller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: const Icon(Icons.call),
                        hintText: "Enter Your Phone Number",
                        filled: true,
                        fillColor: orangecolor.shade50,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: appcolor, width: 2), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: lightcolor, width: 2), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.changeboolvalue();
                        provider.validatephonenumber(
                            "+91${provider.signinphonenumbercontroller.text}",
                            context);
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: provider.showsigninloadingicon
                                ? CircularProgressIndicator(color: blackcolor)
                                : const Text(
                                    "Get OTP",
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
          ));
        });
      }),
    );
  }
}
