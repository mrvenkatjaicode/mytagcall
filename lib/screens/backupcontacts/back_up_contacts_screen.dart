import 'package:flutter/material.dart';
import 'package:mytagcall/calllog/call_log_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../calllog/call_log_screen.dart';
import '../../constant/constant.dart';
import 'back_up_provider.dart';

class BackUpContactScreen extends StatefulWidget {
  const BackUpContactScreen({super.key, this.isservice});
  final bool? isservice;

  @override
  State<BackUpContactScreen> createState() => _BackUpContactScreenState();
}

class _BackUpContactScreenState extends State<BackUpContactScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BackUpContactsScreenProvider>(
      create: (context) => BackUpContactsScreenProvider(),
      child: Builder(builder: (context) {
        return Consumer<BackUpContactsScreenProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appcolor,
              title: const Text(
                "BackUp Duration",
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
                      title: const Text('1 Day Once'),
                      leading: Radio(
                        value: BackUpDurations.onedayonce,
                        groupValue: provider.duration,
                        onChanged: (value) {
                          setState(() {
                            provider.placevalue(value);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('7 Day Once'),
                      leading: Radio(
                        value: BackUpDurations.sevendayonce,
                        groupValue: provider.duration,
                        onChanged: (value) {
                          provider.placevalue(value);
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('15 Day Once'),
                      leading: Radio(
                        value: BackUpDurations.fifteendayonce,
                        groupValue: provider.duration,
                        onChanged: (value) {
                          setState(() {
                            provider.placevalue(value);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('30 Day Once'),
                      leading: Radio(
                        value: BackUpDurations.thirydayonce,
                        groupValue: provider.duration,
                        onChanged: (value) {
                          setState(() {
                            provider.placevalue(value);
                          });
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.isservice ?? false
                            ? {
                                hitupdatefun(context),
                                Provider.of<CallLogScreenProvider>(context,
                                        listen: false)
                                    .getcalldata(context),
                              }
                            : {
                                provider.setbackup(backupschudle),
                                completemessagetypescreen(),
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CallLogScreen()),
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
                            child: Text(
                          widget.isservice ?? false ? "Update" : "Next",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
