// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool? success;
  String? message;
  Data? data;

  LoginResponse({
    this.success,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? accessToken;
  Detail? detail;

  Data({
    this.accessToken,
    this.detail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "detail": detail?.toJson(),
      };
}

class Detail {
  String? name;
  String? companyName;
  dynamic city;
  String? headerType;
  String? expireAt;
  String? mobileNumber;
  String? emailId;
  String? profileId;
  List<String>? messageAlerts;
  String? messageType;
  String? backupSchedule;
  String? whatsappImg;
  String? smscontent;

  Detail({
    this.name,
    this.companyName,
    this.city,
    this.headerType,
    this.expireAt,
    this.mobileNumber,
    this.emailId,
    this.profileId,
    this.messageAlerts,
    this.messageType,
    this.backupSchedule,
    this.whatsappImg,
    this.smscontent
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
        companyName: json["company_name"],
        city: json["city"],
        headerType: json["header_type"],
        expireAt: json["expire_at"],
        mobileNumber: json["mobile_number"],
        emailId: json["email_id"],
        profileId: json["profile_id"],
        messageAlerts: json["message_alerts"] == null
            ? []
            : List<String>.from(json["message_alerts"]!.map((x) => x)),
        messageType: json["message_type"],
        backupSchedule: json["backup_schedule"],
        whatsappImg: json["whatsapp_img"],
        smscontent: json["sms_content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "company_name": companyName,
        "city": city,
        "header_type": headerType,
        "expire_at": expireAt,
        "mobile_number": mobileNumber,
        "email_id": emailId,
        "profile_id": profileId,
        "message_alerts": messageAlerts == null
            ? []
            : List<dynamic>.from(messageAlerts!.map((x) => x)),
        "message_type": messageType,
        "backup_schedule": backupSchedule,
        "whatsapp_img": whatsappImg,
        "sms_content": smscontent,
      };
}
