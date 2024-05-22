import 'package:flutter/material.dart';
import 'package:mytagcall/screens/backupcontacts/back_up_contacts_screen.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../messagealert/message_alert_screen_provider.dart';
import 'message_type_screen_provider.dart';

class MessageTypeScreen extends StatefulWidget {
  const MessageTypeScreen({super.key, this.isservice});
  final bool? isservice;

  @override
  State<MessageTypeScreen> createState() => _MessageTypeScreenState();
}

class _MessageTypeScreenState extends State<MessageTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageTypeScreenProvider>(
      create: (context) => MessageTypeScreenProvider(),
      child: Builder(builder: (context) {
        return Consumer<MessageTypeScreenProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appcolor,
              title: const Text(
                "Message Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Both'),
                      leading: Radio(
                        value: Sendmsg.both,
                        groupValue: provider.msg,
                        onChanged: (value) {
                          provider.bothfunction(value);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('WhatsApp'),
                      leading: Radio(
                        value: Sendmsg.whatsapp,
                        groupValue: provider.msg,
                        onChanged: (value) {
                          provider.whatsappfunction(value);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('SMS'),
                      leading: Radio(
                        value: Sendmsg.sms,
                        groupValue: provider.msg,
                        onChanged: (value) {
                          provider.smsfunction(value);
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.isservice ?? false
                            ? {
                                hitupdatefun(context),
                              }
                            : {
                                provider.setmessagetype(msgtype),
                                // completemessagetypescreen(),
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BackUpContactScreen()),
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
                            child: Provider.of<MessageAlertScreenProvider>(
                                        context,
                                        listen: true)
                                    .updateloading
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
          );
        });
      }),
    );
  }
}
