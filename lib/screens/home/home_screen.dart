import 'package:flutter/material.dart';
import 'package:mytagcall/screens/login/login_screen.dart';
import 'package:mytagcall/screens/register/register_screen.dart';

import '../../constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: const DecorationImage(
              image: AssetImage("assest/bgone.jpg"),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ), // color: appcolor,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                sizedboxh(10.0),
                Image.asset("assest/appicon.png"),
                // sizedboxh(30.0),
                const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins Bold",
                          fontSize: 28,
                          fontWeight: FontWeight.w400),
                    ),
                    sizedboxh(10.0),
                    const Text(
                      "MyTag Call is Mobile Call Management Service Tool. It is valuable tool for small level & mid level business owners.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 17),
                    ),
                    sizedboxh(25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: appcolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                          ),
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileScreen()),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: appcolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
