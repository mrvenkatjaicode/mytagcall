import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constant.dart';

class MessageTypeScreenProvider extends ChangeNotifier {
  MessageTypeScreenProvider() {
    requestmsgpermission();
    getmessagetype();
  }

  Sendmsg msg = Sendmsg.none;

  msgtypecheckfromapi() {
    if (msgtype == "") {
    } else {
      if (msgtype == "WhatsApp") {
        whatsappfunction(Sendmsg.whatsapp);
      }
      if (msgtype == "SMS") {
        smsfunction(Sendmsg.sms);
      }
      if (msgtype == "Both") {
        bothfunction(Sendmsg.both);
      }
    }
  }

  bothfunction(value) {
    msg = value;
    msgtype = "Both";
    notifyListeners();
  }

  whatsappfunction(value) {
    msg = value;
    msgtype = "WhatsApp";
    notifyListeners();
  }

  smsfunction(value) {
    msg = value;
    msgtype = "SMS";
    notifyListeners();
  }

  setmessagetype(value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('messagetype', value);
  }

  getmessagetype() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? mesgtype = prefs.getString('messagetype');
    mesgtype == null ? "" : msgtype = mesgtype;
    msgtypecheckfromapi();
  }
}
