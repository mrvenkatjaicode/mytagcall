import 'package:flutter/material.dart';
import 'package:mytagcall/constant/constant.dart';
import 'package:mytagcall/screens/home/home_screen.dart';
import 'package:mytagcall/screens/membership/member_ship_screen.dart';
import 'package:mytagcall/screens/service/service_screen.dart';
import 'package:mytagcall/screens/uploadmessage/upload_message_screen.dart';

import '../activationcode/activation_code_screen.dart';
import '../infoscreens/appinfo.dart';
import '../register/register_screen.dart';

class MenuListDrawer extends StatefulWidget {
  const MenuListDrawer({super.key});

  @override
  State<MenuListDrawer> createState() => _MenuListDrawerState();
}

class _MenuListDrawerState extends State<MenuListDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            height: 200,
            color: appcolor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                          maxRadius: 30, child: Icon(Icons.person)),
                      Text(name)
                    ]),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileScreen(
                          ismenu: true,
                        )),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.info),
          //   title: const Text(' Activation Code '),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const ActivationCodeScreen()),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.design_services_rounded),
            title: const Text(' Services '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServiceScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_membership),
            title: const Text(' Membership '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MemberShipScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text(' Upload message '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UploadMessageScreen()),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   title: const Text(' Settings '),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(' App Info '),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppInfoScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(' Logout '),
            onTap: () {
              closeregisterscreen();
              closemessagetypescreen();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => isAppFlowViaHome
                        ? const HomeScreen()
                        : const ActivationCodeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
