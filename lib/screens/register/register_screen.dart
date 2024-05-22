import 'package:flutter/material.dart';
import 'package:mytagcall/screens/infoscreens/contentscreen.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import 'register_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.ismenu});
  final bool? ismenu;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileScreenProvider>(
      create: (context) => ProfileScreenProvider(),
      child: Builder(builder: (context) {
        return Consumer<ProfileScreenProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appcolor,
              title: Text(
                widget.ismenu ?? false ? "Profile" : "Register",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: provider.companynamecontroller,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_city),
                        hintText: "Company Name",
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
                    TextFormField(
                      controller: provider.namecontroller,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Name",
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
                    TextFormField(
                      controller: provider.mobilenumbercontroller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLength: 10,
                      readOnly: widget.ismenu ?? false ? true : false,
                      onTap: () {
                        widget.ismenu ?? false
                            ? {
                                snackbar("Phone number can't be changed",
                                    redcolor, context)
                              }
                            : null;
                      },
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: const Icon(Icons.call),
                        hintText: "Mobile Number",
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
                    TextFormField(
                      controller: provider.citycontroller,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on),
                        hintText: "City",
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
                    widget.ismenu ?? false ? const SizedBox() : sizedboxh(20.0),
                    widget.ismenu ?? false
                        ? const SizedBox()
                        : FittedBox(
                            child: Row(
                              children: [
                                Material(
                                  child: Checkbox(
                                    value: provider.agreeterms,
                                    onChanged: (value) {
                                      provider.changecheckvalue(value);
                                    },
                                  ),
                                ),
                                const Text("I have read and agree to the app "),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContentScreen(
                                                  title: "Terms and Conditions",
                                                  content:
                                                      "Content related Terms and Conditions",
                                                )));
                                  },
                                  child: const Text(
                                    " TC ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text("& "),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ContentScreen(
                                                title: "Privacy Policy",
                                                content:
                                                    "Content related Privacy Policy",
                                              )),
                                    );
                                  },
                                  child: const Text(
                                    "Pivacy Policy.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                    sizedboxh(20.0),
                    InkWell(
                      onTap: () {
                        widget.ismenu ?? false
                            ? provider.fetchUserData()
                            : provider.validatetextfields(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const MessageAlertScreen()),
                        // );
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: provider.showprofileloadingicon
                                ? CircularProgressIndicator(
                                    color: blackcolor,
                                  )
                                : Text(
                                    widget.ismenu ?? false
                                        ? "Update"
                                        : "Submit",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
