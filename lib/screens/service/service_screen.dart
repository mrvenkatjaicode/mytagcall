import 'package:flutter/material.dart';
import 'package:mytagcall/constant/constant.dart';
import 'package:mytagcall/screens/backupcontacts/back_up_contacts_screen.dart';
import 'package:mytagcall/screens/messagealert/message_alert_screen.dart';
import 'package:mytagcall/screens/messagetype/message_type_screen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: const Text("Services"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text("Update Message Alert"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MessageAlertScreen(
                            isservice: true,
                          )),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.messenger),
              title: const Text("Update Message Type"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MessageTypeScreen(
                            isservice: true,
                          )),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.messenger),
            //   title: const Text("Update Backup Type"),
            //   trailing: const Icon(Icons.arrow_forward),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const BackUpContactScreen(
            //                 isservice: true,
            //               )),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
