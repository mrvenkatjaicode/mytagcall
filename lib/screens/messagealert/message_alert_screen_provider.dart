import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../calllog/call_log_screen_provider.dart';
import '../../constant/constant.dart';

class MessageAlertScreenProvider extends ChangeNotifier {
  MessageAlertScreenProvider(context) {
    getphonenumber();
    Provider.of<CallLogScreenProvider>(context, listen: false)
        .getpermissionforphone();
    functiontickenable();
    checkmissedcallmessagealert();
    checkrecivedcallmessagealert();
  }

  CollectionReference<Map<String, dynamic>> shopProfileRef =
      FirebaseFirestore.instance.collection('profileDetails');

  bool missedcalls = false;
  bool recivedcalls = false;
  bool dailedcalls = false;
  bool all = false;

  bool updateloading = false;

  changeupdateloadingstate(val) {
    updateloading = val;
    notifyListeners();
  }

  functiontickenable() {
    if (messagealertlists.isNotEmpty) {
      if (messagealertlists.contains("Missed Calls")) {
        missedcallmessagealert(true);
        missedcallupdate(true);
      }
      if (messagealertlists.contains("Received Calls")) {
        recivedcallmessagealert(true);
        recivedcallupdate(true);
      }
      if (messagealertlists.contains("Dialled Calls")) {
        dailedcallmessagealert(true);
        dailedcallupdate(true);
      }
    } else {
      missedcalls = ischeckmissedcalls!;
      recivedcalls = ischeckrecivedcalls!;
    }
  }

  missedcallupdate(value) {
    missedcalls = value;
    ischeckmissedcalls = missedcalls;
    notifyListeners();
  }

  recivedcallupdate(value) {
    recivedcalls = value;
    ischeckrecivedcalls = recivedcalls;
    notifyListeners();
  }

  dailedcallupdate(value) {
    dailedcalls = value;
    notifyListeners();
  }

  Future<void> updateproduct() async {
    shopProfileRef
        .doc(phonenumber)
        .update({
          "userDetails": [
            {
              'msgAlert': "gdg",
            }
          ]
        })
        .then((value) => debugPrint('Data updated successfully!'))
        .catchError((error) => debugPrint('Failed to update data: $error'));
  }

  Future<void> fetchProductsData() async {
    QuerySnapshot querySnapshot =
        await shopProfileRef.doc(phonenumber).collection('userDetails').get();
    List<dynamic> list = [];
    List<String> idlist = [];

    for (var doc in querySnapshot.docs) {
      list.add(json.encode(doc.data()));
      idlist.add(doc.id);
    }
    if (list.isEmpty) {
    } else {}
  }
}
