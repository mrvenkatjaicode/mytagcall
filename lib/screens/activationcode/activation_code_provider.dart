import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytagcall/constant/constant.dart';
import 'package:mytagcall/screens/activationcode/activation_code_model.dart';

import '../messagealert/message_alert_screen.dart';

class ActivationScreenProvider extends ChangeNotifier {
  bool isacivationcodeloading = false;

  TextEditingController activationcontroller = TextEditingController(text: "");

  LoginResponse loginresponse = LoginResponse();

  changeboolvalue() {
    isacivationcodeloading = true;
    notifyListeners();
  }

  loginusingactivationcode(context) async {
    var headers = {'Content-Type': 'application/json'};

    var url = "$baseurl/login";

    var body = json.encode({"code": activationcontroller.text});

    http
        .post(Uri.parse(url), headers: headers, body: body)
        .then((response) async {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        loginresponse = loginResponseFromJson(response.body);
        debugPrint(loginresponse.data!.detail!.messageAlerts.toString());
        messagealertlists = loginresponse.data!.detail!.messageAlerts!.isEmpty
            ? [""]
            : loginresponse.data!.detail!.messageAlerts!;
        msgtype = loginresponse.data!.detail!.messageType.toString();
        backupschudle = loginresponse.data!.detail!.backupSchedule.toString();
        companyname = loginresponse.data!.detail!.companyName.toString();
        name = loginresponse.data!.detail!.name.toString();
        mobilenumber = loginresponse.data!.detail!.mobileNumber.toString();
        city = loginresponse.data!.detail!.city ?? "";
        expdate = loginresponse.data!.detail!.expireAt.toString();
        accesstoken = loginresponse.data!.accessToken.toString();
        whatsappimageurl = loginresponse.data!.detail!.whatsappImg.toString();
        msgcontent = loginresponse.data!.detail!.smscontent.toString();
        activationcode = activationcontroller.text;
        await setmsgcontent(msgcontent);
        setimageurlstring(whatsappimageurl);
        setactivationcode(activationcode);
        setcompanyname();
        setusername();
        setphonenumber();
        setcity();
        setexpirydate();
        setaccesstoken(accesstoken);
        //  completeregisterscreen();
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MessageAlertScreen(
                    isactivebackicon: true,
                    isservice: false,
                  )),
        );
        isacivationcodeloading = false;
        notifyListeners();
      } else {
        debugPrint(response.statusCode.toString());
        debugPrint(response.body);
        isacivationcodeloading = false;
        notifyListeners();
      }
    });
  }
}
