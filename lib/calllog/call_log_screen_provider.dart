import 'dart:async';
import 'dart:convert';

import 'package:call_log/call_log.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mytagcall/calllog/call_log_model.dart';
import 'package:phone_state_background/phone_state_background.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../constant/constant.dart';

final navigatorkey = GlobalKey<NavigatorState>();
List<Alldatum> callloglist = [];
Alldatum calllogdatas = Alldatum();
@pragma('vm:entry-point')
Future<void> phoneStateBackgroundCallbackHandler(
  PhoneStateBackgroundEvent event,
  String number,
  int duration,
) async {
  switch (event) {
    case PhoneStateBackgroundEvent.incomingstart:
      debugPrint('Incoming call start, number: $number, duration: $duration s');

      break;
    case PhoneStateBackgroundEvent.incomingmissed:
      debugPrint(
          'Incoming call missed, number: $number, duration: $duration s');
      //  getphonenumberandsendwhatsmsg();
      checkmissedcallconditionfunction(number);

      //NotificationController.createNewNotification();
      break;
    case PhoneStateBackgroundEvent.incomingreceived:
      debugPrint(
          'Incoming call received, number: $number, duration: $duration s');
      //  getphonenumberandsendwhatsmsg();

      // showOverLay(number);
      break;
    case PhoneStateBackgroundEvent.incomingend:
      debugPrint('Incoming call ended, number: $number, duration $duration s');
      //  getphonenumberandsendwhatsmsg();
      checkrecivedendcallconditionfunction(number);
      // NotificationController.createNewNotification();
      break;
    case PhoneStateBackgroundEvent.outgoingstart:
      debugPrint('Ougoing call start, number: $number, duration: $duration s');
      //   getphonenumberandsendwhatsmsg();

      // showOverLay(number);
      break;
    case PhoneStateBackgroundEvent.outgoingend:
      debugPrint('Ougoing call ended, number: $number, duration: $duration s');
      //    getphonenumberandsendwhatsmsg();

      //NotificationController.createNewNotification();
      break;
  }
}

checkmissedcallconditionfunction(number) async {
  await checkmissedcallmessagealert();
  if (ischeckmissedcalls ?? false) {
    await getmessagetypeconst();
    if (msgtype == "WhatsApp") {
      sendwhatsappmsg(number);
    } else if (msgtype == "SMS") {
      requestpermission(number);
    } else if (msgtype == "Both") {
      sendwhatsappmsg(number);
      requestpermission(number);
    } else {}
  }
}

checkrecivedendcallconditionfunction(number) async {
  await checkrecivedcallmessagealert();
  if (ischeckrecivedcalls ?? false) {
    await getmessagetypeconst();
    if (msgtype == "WhatsApp") {
      sendwhatsappmsg(number);
    } else if (msgtype == "SMS") {
      requestpermission(number);
    } else if (msgtype == "Both") {
      sendwhatsappmsg(number);
      requestpermission(number);
    } else {}
  }
}

class CallLogScreenProvider extends ChangeNotifier with WidgetsBindingObserver {
  CallLogScreenProvider(context) {
    streamController = StreamController();
    stream = streamController.stream;
    getcalldata(context);
    getusername();
    getexpirydate();
    WidgetsBinding.instance.addObserver(this);
    getpermissionforphone();
    init();
    callcheckmissedcallfunction();
    callcheckrecivedcallfunction();
    getaccesstoken();
    getpermission();
    getmsgcontent();
  }

  Iterable<CallLogEntry> callLogEntries = <CallLogEntry>[];
  StreamController streamController = StreamController();
  Stream? stream;
  bool hasPermission = false;
String? msgcontent;

  bool? miscal;

  funmiscallplace() {
    miscal = ischeckmissedcalls;
    notifyListeners();
  }

  callcheckmissedcallfunction() async {
    await checkmissedcallmessagealert();
    debugPrint("${ischeckmissedcalls.toString()}---");
    notifyListeners();
  }

  callcheckrecivedcallfunction() {
    checkrecivedcallmessagealert();
    debugPrint(ischeckrecivedcalls.toString());
    notifyListeners();
  }

  List<CallLogEntry> listcall = [];

  getcalldata(context) async {
    streamController.add("Loading");
    final Iterable<CallLogEntry> result = await CallLog.query();
    callLogEntries = result;
    for (CallLogEntry entry in callLogEntries) {
      gettimestamptodate(listcall, entry, entry.timestamp, context);
    }
    notifyListeners();
  }

  void gettimestamptodate(
      List<CallLogEntry> listcall, entry, timestamp, context) async {
    await getbackupconst();

    var days = backupschudle == "1 Days Once"
        ? 1
        : backupschudle == "7 Days Once"
            ? 7
            : backupschudle == "15 Days Once"
                ? 15
                : 30;
    await initializeDateFormatting('en_IN', null);
    DateTime today = DateTime.now();
    DateFormat("dd/MM/yyyy HH:mm:ss").format(today);

    DateTime sevendays = today.subtract(Duration(days: days));
    var date = DateFormat("dd/MM/yyyy HH:mm:ss").format(sevendays);
    // Replace this with your actual Timestamp from Firestore
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String indianTime = formatDateTimeToIndian(dateTime);

    final DateFormat dateTimeFormatter = DateFormat("dd/MM/yyyy HH:mm:ss");
    DateTime datetime2 = dateTimeFormatter.parse(indianTime);
    List<Alldatum> loglist = [];
    Alldatum calllog = Alldatum();

    if (sevendays.isBefore(datetime2)) {
      calllog = Alldatum();
      // calllog.type = entry;
      // calllog.datetime = date.split("")[0];
      // calllog.name = listcall[i].name ?? "";
      // calllog.number = listcall[i].number ?? "";
      // calllog.duration = listcall[i].duration.toString();
      // calllog.datetime = date.split("")[0];

      listcall.add(entry);
      listfunction();

      //  streamController.add(listcall);
      debugPrint(datetime2.toString());
      // notifyListeners();
    }
    // Convert to Indian time format
    // debugPrint('Current DateTime: $dateTime');
    // debugPrint('Indian Time Format: $indianTime');
  }

  String formatDateTimeToIndian(DateTime dateTime) {
    // Create a DateFormat instance for Indian locale
    final indianFormatter = DateFormat('dd/MM/yyyy HH:mm:ss', 'en_IN');

    // Format the DateTime to Indian time format
    return indianFormatter.format(dateTime);
  }

  getpermissionforphone() {
    //_requestPermission();
    _hasPermission();
  }

  Future<void> _hasPermission() async {
    final permission = await PhoneStateBackground.checkPermission();
    // if (mounted) {
    hasPermission = permission;
    notifyListeners();
    init();
    // }
  }

  // Future<void> _requestPermission() async {
  //   await PhoneStateBackground.requestPermissions();
  // }
  listfunction() {
    CallLogRequest calllogrequest = CallLogRequest();
    Alldatum callloglistrequest = Alldatum();
    List<Alldatum> callloglist = [];
    calllogrequest.deviceid = "qwer";
    for (int i = 0; i < listcall.length; i++) {
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(listcall[i].timestamp!);
      String indianTime = formatDateTimeToIndian(dateTime);

      final DateFormat dateTimeFormatter = DateFormat("dd/MM/yyyy HH:mm:ss");
      DateTime date = dateTimeFormatter.parse(indianTime);
      callloglistrequest = Alldatum();
      callloglistrequest.type = listcall[i].callType!.name;
      callloglistrequest.datetime = date.toString();
      callloglistrequest.name = listcall[i].name ?? "";
      callloglistrequest.number = listcall[i].number ?? "";
      callloglistrequest.duration = listcall[i].duration.toString();

      callloglist.add(callloglistrequest);
    }
    streamController.add(callloglist);

    calllogrequest.alldata = callloglist;
  }

  hitcalllogapi() {
    CallLogRequest calllogrequest = CallLogRequest();
    Alldatum callloglistrequest = Alldatum();
    List<Alldatum> callloglist = [];
    calllogrequest.deviceid = "qwer";
    for (int i = 0; i < listcall.length; i++) {
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(listcall[i].timestamp!);
      String indianTime = formatDateTimeToIndian(dateTime);

      final DateFormat dateTimeFormatter = DateFormat("dd/MM/yyyy HH:mm:ss");
      DateTime date = dateTimeFormatter.parse(indianTime);
      callloglistrequest = Alldatum();
      callloglistrequest.type = listcall[i].callType!.name;
      callloglistrequest.datetime = date.toString();
      callloglistrequest.name = listcall[i].name ?? "";
      callloglistrequest.number = listcall[i].number ?? "";
      callloglistrequest.duration = listcall[i].duration.toString();

      callloglist.add(callloglistrequest);
    }
    streamController.add(callloglist);

    calllogrequest.alldata = callloglist;
    // debugPrint(json.encode(callloglist));
    // debugPrint(calllogrequest.deviceid.toString());

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accesstoken'
    };
    var url = "$baseurl/syncdata";

    var requestbody = callLogRequestToJson(calllogrequest);

    http
        .post(Uri.parse(url), headers: headers, body: requestbody)
        .then((response) {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        notifyListeners();
      } else {
        debugPrint(response.statusCode.toString());
        debugPrint(response.body);
        notifyListeners();
      }
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  hituploadmsgapi() {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accesstoken'
    };
    var url = "$baseurl/updatemessage";

    var rbody = json.encode({
      "message_type": "WhatsApp",
      "whatsapp_content": "caaa",
      "sms_content": "cbbb",
      "whatsapp_img": "data:image/png;base64"
    });
    try {
      http.post(Uri.parse(url), headers: headers, body: rbody).then((response) {
        if (response.statusCode == 200) {
          debugPrint(response.body);
        } else {
          debugPrint(response.statusCode.toString());
          debugPrint(response.body);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> init() async {
    if (hasPermission != true) return;
    await PhoneStateBackground.initialize(phoneStateBackgroundCallbackHandler);
  }
}
