import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytagcall/screens/backupcontacts/back_up_provider.dart';
import 'package:mytagcall/screens/messagealert/message_alert_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:background_sms/background_sms.dart';

import '../screens/messagetype/message_type_screen_provider.dart';

var redcolor = Colors.red;
var purpulecolor = Colors.purple;
var greencolor = Colors.green;
var blackcolor = Colors.black;
var greycolor = Colors.grey;
var whitecolor = Colors.white;
var orangecolor = Colors.orange;
var lightcolor = const Color(0xFFFCFDFF);
var appcolor = const Color(0xFFFECD42);

String phonenumber = "";
String userid = "";

bool? ischeckcompleteregisterscreen;
bool? ischeckcompletemessagetypescreen;
bool? ischeckmissedcalls;
bool? ischeckrecivedcalls;
bool? ischeckdailedcalls;

bool isAppFlowViaHome = false;

List<String> messagealertlists = [];

String? msgtype;

String? backupschudle;

String companyname = "";

String mobilenumber = "";

String name = "";

String city = "";

String expdate = "";

String accesstoken = "";

String? msgcontent;

String imagestring = "";

String messagedata = "";

String whatsappimageurl = "";

String activationcode = "";

enum Sendmsg { whatsapp, sms, both, none }

enum BackUpDurations {
  onedayonce,
  sevendayonce,
  fifteendayonce,
  thirydayonce,
  none
}

String baseurl = "https://whatsapp.leeways.in/api/v1";

sizedboxh(h) {
  return SizedBox(
    height: h,
  );
}

snackbar(text, color, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(text),
    ),
  );
}

sendwhatsappmsg(phonenumber) async {
  await getmsgcontent();
  await getimageurlstring();
  phonenumber.replaceFirst("+", "");
  String url =
      "https://wchat.mytag.in/send.php?username=MyTag&password=MyTag&type=media&message=$msgcontent&media_url=$whatsappimageurl&number=${phonenumber.replaceFirst("+", "")}";
  http
      .get(
    Uri.parse(url),
  )
      .then((response) {
    if (response.statusCode == 200) {
      debugPrint(response.body);
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint(response.reasonPhrase);
    }
  });
}

hitupdatefun(context) async {
  Provider.of<MessageAlertScreenProvider>(context, listen: false)
      .changeupdateloadingstate(true);
  missedcallmessagealert(ischeckmissedcalls);
  await checkmissedcallmessagealert();
  recivedcallmessagealert(ischeckrecivedcalls);
  checkrecivedcallmessagealert();
  Provider.of<MessageTypeScreenProvider>(context, listen: false)
      .setmessagetype(msgtype);
  await Provider.of<MessageTypeScreenProvider>(context, listen: false)
      .getmessagetype();

  Provider.of<BackUpContactsScreenProvider>(context, listen: false)
      .setbackup(backupschudle);
  Provider.of<BackUpContactsScreenProvider>(context, listen: false).getbackup();
  updatemessagealertapi(context);
}

updatemessagealertapi(context) {
  String url = "$baseurl/updateuserdetail";

  var body = {
    "message_alerts": [
      ischeckmissedcalls ?? false ? "Missed Calls" : null,
      ischeckrecivedcalls ?? false ? "Received Calls" : null
    ],
    "message_type": msgtype,
    "backup_schedule": backupschudle
  };

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accesstoken'
  };

  http
      .post(Uri.parse(url), headers: headers, body: json.encode(body))
      .then((response) {
    if (response.statusCode == 200) {
      Provider.of<MessageAlertScreenProvider>(context, listen: false)
          .changeupdateloadingstate(false);

      debugPrint(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: greencolor,
          content: const Text("Updated Successfully"),
        ),
      );
    } else {
      Provider.of<MessageAlertScreenProvider>(context, listen: false)
          .changeupdateloadingstate(false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redcolor,
          content: const Text("Error"),
        ),
      );
      debugPrint(response.statusCode.toString());
    }
  });
}

void smsmsg(pnumber) async {
  SmsStatus res = await BackgroundSms.sendMessage(
      phoneNumber: pnumber, message: msgcontent.toString());
  debugPrint(res.toString());
}

requestpermission(pnumber) async {
  if (await Permission.sms.isGranted) {
    await getmsgcontent();

    smsmsg(pnumber);
  } else {
    var status = await Permission.sms.request();
    if (status.isGranted) {
      await getmsgcontent();

      smsmsg(pnumber);
    }
  }
}

getpermission() async {
  if (await Permission.sms.isGranted) {
    debugPrint("granted");
  } else {
    var status = await Permission.sms.request();
    if (status.isGranted) {
      debugPrint("granted");
    }
  }
}

requestmsgpermission() async {
  if (await Permission.sms.isGranted) {
  } else {
    var status = await Permission.sms.request();
    if (status.isGranted) {}
  }
}

missedcallmessagealert(val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ismissedcallmessagealert', val ?? false);
}

closemissedcallmessagealert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ismissedcallmessagealert', false);
}

checkmissedcallmessagealert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkmissedcalls = prefs.getBool('ismissedcallmessagealert');
  ischeckmissedcalls = checkmissedcalls;
  debugPrint("Missed call - ${ischeckmissedcalls.toString()}");
}

recivedcallmessagealert(val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isrecivedcallmessagealert', val ?? false);
}

closerecivedcallmessagealert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isrecivedcallmessagealert', false);
}

checkrecivedcallmessagealert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkrecivedcalls = prefs.getBool('isrecivedcallmessagealert');
  ischeckrecivedcalls = checkrecivedcalls;
  debugPrint("Recived call - ${ischeckrecivedcalls.toString()}");
}

dailedcallmessagealert(val) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isdailedcallmessagealert', val);
}

closedailedcallmessagealert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isdailedcallmessagealert', false);
}

checkdailedcallmessagealert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkdailedcalls = prefs.getBool('isdailedcallmessagealert');
  ischeckdailedcalls = checkdailedcalls;
  debugPrint("Dailed call - ${ischeckdailedcalls.toString()}");
}

completeregisterscreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isregisterscreen', true);
}

closeregisterscreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isregisterscreen', false);
}

checkcompleteregistercreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkcompleteregisterscreen = prefs.getBool('isregisterscreen');
  ischeckcompleteregisterscreen = checkcompleteregisterscreen;
}

completemessagetypescreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ismessagetypescreen', true);
}

closemessagetypescreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ismessagetypescreen', false);
}

checkcompletemessagetypescreen() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? checkcompletemessagetypescreen =
      prefs.getBool('ismessagetypescreen');
  ischeckcompletemessagetypescreen = checkcompletemessagetypescreen;
}

setphonenumber() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('phonenumber', mobilenumber);
}

getphonenumber() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? phone = prefs.getString('phonenumber');
  phonenumber = phone.toString();
}

getmessagetypeconst() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? mesgtype = prefs.getString('messagetype');
  mesgtype == null ? "" : msgtype = mesgtype;
}

getbackupconst() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? backup = prefs.getString('backup');
  backup == null ? "" : backupschudle = backup;
}

getphonenumberandsendwhatsmsg() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? phone = prefs.getString('phonenumber');
  sendwhatsappmsg(phone);
}

setusername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', name);
}

setexpirydate() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('expirydate', expdate);
}

getusername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? username = prefs.getString('username');
  name = username.toString();
}

getexpirydate() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? expirydate = prefs.getString('expirydate');
  expdate = expirydate.toString();
  checkdate();
}

setcompanyname() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('companyname', companyname);
}

getcompanyname() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? compname = prefs.getString('companyname');
  companyname = compname.toString();
}

setcity() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('city', city);
}

getcity() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? ccity = prefs.getString('city');
  city = ccity.toString();
}

setaccesstoken(value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('accesstoken', value);
}

getaccesstoken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? acstoken = prefs.getString('accesstoken');
  accesstoken = acstoken.toString();
  debugPrint(acstoken);
}

setimgstring(value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('imgstring', value);
}

getimgstring() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? imgstring = prefs.getString('imgstring');
  imagestring = imgstring.toString();
}

setmsgcontent(value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('msgcontent', value);
}

getmsgcontent() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? msggcontent = prefs.getString('msgcontent');
  msgcontent = msggcontent.toString();
  debugPrint(msggcontent);
}

setactivationcode(value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('activationcode', value);
}

getactivationcode() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? code = prefs.getString('activationcode');
  activationcode = code.toString();
  debugPrint(code);
}

setimageurlstring(value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('imageurlstring', value);
}

getimageurlstring() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? imgurl = prefs.getString('imageurlstring');
  whatsappimageurl = imgurl.toString();
  debugPrint(imgurl);
  debugPrint(whatsappimageurl);
}

bool? isactive;
checkdate() {
  expdate.split("-");
  DateTime currentDate = DateTime.now();

  // Create a given date (replace this with your date)
  DateTime givenDate = DateTime(
      /* 2024, 3, 3 */
      int.parse(expdate.split("-")[2]),
      int.parse(expdate.split("-")[1]),
      int.parse(expdate.split("-")[0])); // Example: March 10, 2024

  // Check if the given date is greater than the current date
  isactive = givenDate.compareTo(currentDate) > 0;

  // Print the result
  debugPrint('Is the given date greater than the current date? $isactive');
}

var aboutus = "";

var privacypolicy = "";

var termsofuse = "";
