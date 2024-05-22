import 'dart:convert';

CallLogRequest callLogRequestFromJson(String str) => CallLogRequest.fromJson(json.decode(str));

String callLogRequestToJson(CallLogRequest data) => json.encode(data.toJson());

class CallLogRequest {
    String? deviceid;
    List<Alldatum>? alldata;

    CallLogRequest({
        this.deviceid,
        this.alldata,
    });

    factory CallLogRequest.fromJson(Map<String, dynamic> json) => CallLogRequest(
        deviceid: json["deviceid"],
        alldata: json["alldata"] == null ? [] : List<Alldatum>.from(json["alldata"]!.map((x) => Alldatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "deviceid": deviceid,
        "alldata": alldata == null ? [] : List<dynamic>.from(alldata!.map((x) => x.toJson())),
    };
}

class Alldatum {
    String? type;
    String? datetime;
    String? name;
    String? number;
    String? duration;

    Alldatum({
        this.type,
        this.datetime,
        this.name,
        this.number,
        this.duration,
    });

    factory Alldatum.fromJson(Map<String, dynamic> json) => Alldatum(
        type: json["type"],
        datetime: json["datetime"],
        name: json["name"],
        number: json["number"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "datetime": datetime,
        "name": name,
        "number": number,
        "duration": duration,
    };
}
