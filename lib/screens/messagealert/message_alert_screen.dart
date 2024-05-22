import 'package:flutter/material.dart';
import 'package:mytagcall/screens/messagealert/message_alert_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../messagetype/message_type_screen.dart';

class MessageAlertScreen extends StatefulWidget {
  const MessageAlertScreen({super.key, this.isservice, this.isactivebackicon});
  final bool? isservice;
  final bool? isactivebackicon;
  @override
  State<MessageAlertScreen> createState() => _MessageAlertScreenState();
}

class _MessageAlertScreenState extends State<MessageAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageAlertScreenProvider>(
      create: (context) => MessageAlertScreenProvider(context),
      child: Builder(builder: (context) {
        return Consumer<MessageAlertScreenProvider>(
            builder: (context, provider, child) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: appcolor,
                leading: widget.isservice ?? false
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back))
                    : widget.isactivebackicon ?? false
                        ? IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back))
                        : const SizedBox(),
                // actions: [
                //   IconButton(
                //       onPressed: () {
                //         checkmissedcallmessagealert();
                //         checkrecivedcallmessagealert();
                //         checkdailedcallmessagealert();
                //       },
                //       icon: const Icon(Icons.add))
                // ],
                title: const Text(
                  "Message Alert",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        secondary:
                            const Icon(Icons.call_missed, color: Colors.red),
                        title: const Text('Missed Calls'),
                        value: provider.missedcalls,
                        onChanged: (value) {
                          //   missedcallmessagealert(value);
                          provider.missedcallupdate(value);
                        },
                      ),
                      CheckboxListTile(
                        secondary: const Icon(Icons.call_received,
                            color: Colors.green),
                        title: const Text('Recived Calls'),
                        value: provider.recivedcalls,
                        onChanged: (value) {
                          //   recivedcallmessagealert(value);
                          provider.recivedcallupdate(value);
                        },
                      ),
                      // CheckboxListTile(
                      //   secondary:
                      //       const Icon(Icons.call_made, color: Colors.green),
                      //   title: const Text('Dialled Calls'),
                      //   value: provider.dailedcalls,
                      //   onChanged: (value) {
                      //     dailedcallmessagealert(value);
                      //     provider.dailedcallupdate(value);
                      //   },
                      // ),
                      // CheckboxListTile(
                      //   secondary: Icon(
                      //     Icons.call,
                      //     color: greencolor,
                      //   ),
                      //   title: const Text('All'),
                      //   value: all,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       all = value!;
                      //     });
                      //   },
                      // ),
                      InkWell(
                        onTap: () async {
                          widget.isservice ?? false
                              ? {hitupdatefun(context)}
                              : {
                                  await checkmissedcallmessagealert(),
                                  missedcallmessagealert(ischeckmissedcalls),
                                  checkrecivedcallmessagealert(),
                                  recivedcallmessagealert(ischeckrecivedcalls),
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MessageTypeScreen()),
                                  ),
                                };
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: appcolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: provider.updateloading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      widget.isservice ?? false
                                          ? "Update"
                                          : "Next",
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
            ),
          );
        });
      }),
    );
  }
}
