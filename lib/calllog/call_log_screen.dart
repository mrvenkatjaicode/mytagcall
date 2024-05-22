import 'package:flutter/material.dart';
import 'package:mytagcall/screens/drawer/menulist.dart';
import 'package:provider/provider.dart';

import '../constant/constant.dart';
import 'call_log_screen_provider.dart';

class CallLogScreen extends StatefulWidget {
  const CallLogScreen({super.key});

  @override
  State<CallLogScreen> createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CallLogScreenProvider>(
      create: (context) => CallLogScreenProvider(context),
      child: Builder(builder: (context) {
        return Consumer<CallLogScreenProvider>(
            builder: (context, provider, child) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: appcolor,
                title: const Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        checkmissedcallmessagealert();
                        checkrecivedcallmessagealert();
                      },
                      icon: Icon(Icons.add))
                ],
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: provider.stream,
                  builder: (BuildContext ctx,
                      AsyncSnapshot /* <List<PiDetail>> */
                          snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("No data Found"),
                      );
                    }
                    if (snapshot.data == "Loading") {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            // var duration =
                            //     ((snapshot.data![index].duration / 60));
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 5, top: 4, bottom: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: greycolor.shade300,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          snapshot.data![index].type
                                                      .toString() ==
                                                  "outgoing"
                                              ? const Icon(Icons.call_made,
                                                  color: Colors.green)
                                              : snapshot.data![index].type
                                                          .toString() ==
                                                      "incoming"
                                                  ? const Icon(
                                                      Icons.call_received,
                                                      color: Colors.green)
                                                  : snapshot.data![index].type
                                                              .toString() ==
                                                          "missed"
                                                      ? const Icon(
                                                          Icons.call_missed,
                                                          color: Colors.red)
                                                      : snapshot.data![index]
                                                                  .type
                                                                  .toString() ==
                                                              "rejected"
                                                          ? const Icon(
                                                              Icons
                                                                  .phonelink_erase_rounded,
                                                              color: Colors.red)
                                                          : const SizedBox(),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].name
                                                            .toString() ==
                                                        ""
                                                    ? "Unknown Number"
                                                    : snapshot.data![index].name
                                                        .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].number
                                                  .toString()),
                                              Text(
                                                snapshot.data![index].datetime
                                                    .toString()
                                                    .split(" ")[0],
                                                style: TextStyle(
                                                    color: greencolor),
                                              ),
                                              Text(
                                                int.parse(snapshot.data![index]
                                                            .duration) >
                                                        60
                                                    ? "${(int.parse(snapshot.data![index].duration) ~/ 60).toString()}:${(int.parse(snapshot.data![index].duration) % 60).toString()} m"
                                                    : "${snapshot.data![index].duration.toString()} s",
                                                style: TextStyle(
                                                    color: greencolor),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            provider.makePhoneCall(snapshot
                                                .data![index].number
                                                .toString());
                                            // provider.hitcalllogapi();
                                            // getphonenumberandsendwhatsmsg();
                                          },
                                          icon: Icon(
                                            Icons.call,
                                            color: greencolor,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );

                            // ListTile(
                            //   leading: snapshot.data![index].type.toString() ==
                            //           "outgoing"
                            //       ? const Icon(Icons.call_made,
                            //           color: Colors.green)
                            //       : snapshot.data![index].type.toString() ==
                            //               "incoming"
                            //           ? const Icon(Icons.call_received,
                            //               color: Colors.green)
                            //           : snapshot.data![index].type.toString() ==
                            //                   "missed"
                            //               ? const Icon(Icons.call_missed,
                            //                   color: Colors.red)
                            //               : snapshot.data![index].type
                            //                           .toString() ==
                            //                       "rejected"
                            //                   ? const Icon(
                            //                       Icons.phonelink_erase_rounded,
                            //                       color: Colors.red)
                            //                   : null,
                            //   title: Row(
                            //     children: [
                            //       Text(snapshot.data![index].name.toString() == ""
                            //           ? "Unknown Number"
                            //           : snapshot.data![index].name.toString()),
                            //       Text(
                            //         "   ${snapshot.data![index].datetime.toString().split(" ")[0]}",
                            //         style: TextStyle(color: greencolor),
                            //       ),
                            //     ],
                            //   ),
                            //   subtitle: Row(
                            //     children: [
                            //       Text(snapshot.data![index].number.toString()),
                            //       Text(
                            //         int.parse(snapshot.data![index].duration) > 60
                            //             ? "   ${(int.parse(snapshot.data![index].duration) ~/ 60).toString()}:${(int.parse(snapshot.data![index].duration) % 60).toString()}"
                            //             : "  ${snapshot.data![index].duration.toString()}",
                            //         style: TextStyle(color: greencolor),
                            //       )
                            //     ],
                            //   ),
                            //   trailing: Wrap(
                            //     spacing: 12,
                            //     children: [
                            //       IconButton(
                            //           onPressed: () {
                            //             provider.makePhoneCall(snapshot
                            //                 .data![index].number
                            //                 .toString());
                            //             // provider.hitcalllogapi();
                            //             // getphonenumberandsendwhatsmsg();
                            //           },
                            //           icon: const Icon(Icons.call)),
                            //       // IconButton(
                            //       //     onPressed: () {
                            //       //       // provider
                            //       //       //     .gettimestamptodate(1708750944478);
                            //       //     },
                            //       //     icon: ischeckmissedcalls ?? false
                            //       //         ? const Icon(Icons.message)
                            //       //         : const Icon(Icons.call)),
                            //     ],
                            //   ),
                            // );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              drawer: const MenuListDrawer(),
            ),
          );
        });
      }),
    );
  }
}
