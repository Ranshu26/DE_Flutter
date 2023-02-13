// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.serialno,
    required this.deviceId,
    required this.mean,
    required this.sd,
    required this.speciesName,
    required this.temperature,
    required this.timeStamp,
    // required this.title,
    // required this.body,
  });

  int serialno;
  int deviceId;
  int mean;
  int sd;
  int speciesName;
  int temperature;
  int timeStamp;
  // String title;
  // String body;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        serialno: json["userId"],
        deviceId: json["deviceId"],
        mean: json["mean"],
        sd: json["sd"],
        speciesName: json["speciesName"],
        temperature: json["temperature"],
        timeStamp: json["timeStamp"],
        // title: json["title"],
        // body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "serialno": serialno,
        "species": deviceId,
        "species": mean,
        "species": sd,
        "speciesName": speciesName,
        "temperature": temperature,
        "timeStamp": timeStamp,
        // "title": title,
        // "body": body,
      };
}
