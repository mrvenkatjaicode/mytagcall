import 'package:flutter/material.dart';
import 'package:mytagcall/constant/constant.dart';
import 'package:mytagcall/screens/activationcode/activation_code_provider.dart';
import 'package:provider/provider.dart';

class ActivationCodeScreen extends StatefulWidget {
  const ActivationCodeScreen({super.key});

  @override
  State<ActivationCodeScreen> createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActivationScreenProvider>(
      create: (context) => ActivationScreenProvider(),
      child: Builder(builder: (context) {
        return Consumer<ActivationScreenProvider>(
            builder: (context, provider, child) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: appcolor,
                leading: const SizedBox(),
                title: const Text("Activation Code"),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  const Text(
                    "Enter your Activation Code here to access the app features. I hope this will help you to grow your business/company.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20),
                  ),
                  sizedboxh(15.0),
                  TextFormField(
                    controller: provider.activationcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    decoration: InputDecoration(
                      counterText: "",
                      // prefixIcon: const Icon(Icons.code),
                      hintText: "Activation Code",
                      hintStyle: const TextStyle(fontSize: 20),
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
                  sizedboxh(20.0),
                  InkWell(
                    onTap: () async {
                      provider.changeboolvalue();
                      provider.loginusingactivationcode(context);
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: appcolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: provider.isacivationcodeloading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Verify",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
      }),
    );
  }
}
