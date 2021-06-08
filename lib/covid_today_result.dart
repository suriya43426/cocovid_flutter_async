// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.confirmed,
    required this.recovered,
    required this.hospitalized,
    required this.deaths,
    required this.newConfirmed,
    required this.newRecovered,
    required this.newHospitalized,
    required this.newDeaths,
    required this.updateDate,
    required this.devBy,
  });

  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  String updateDate;
  String devBy;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    confirmed: json["Confirmed"] == null ? null : json["Confirmed"],
    recovered: json["Recovered"] == null ? null : json["Recovered"],
    hospitalized: json["Hospitalized"] == null ? null : json["Hospitalized"],
    deaths: json["Deaths"] == null ? null : json["Deaths"],
    newConfirmed: json["NewConfirmed"] == null ? null : json["NewConfirmed"],
    newRecovered: json["NewRecovered"] == null ? null : json["NewRecovered"],
    newHospitalized: json["NewHospitalized"] == null ? null : json["NewHospitalized"],
    newDeaths: json["NewDeaths"] == null ? null : json["NewDeaths"],
    updateDate: json["UpdateDate"] == null ? null : json["UpdateDate"],
    devBy: json["DevBy"] == null ? null : json["DevBy"],
  );

  Map<String, dynamic> toJson() => {
    "Confirmed": confirmed == null ? null : confirmed,
    "Recovered": recovered == null ? null : recovered,
    "Hospitalized": hospitalized == null ? null : hospitalized,
    "Deaths": deaths == null ? null : deaths,
    "NewConfirmed": newConfirmed == null ? null : newConfirmed,
    "NewRecovered": newRecovered == null ? null : newRecovered,
    "NewHospitalized": newHospitalized == null ? null : newHospitalized,
    "NewDeaths": newDeaths == null ? null : newDeaths,
    "UpdateDate": updateDate == null ? null : updateDate,
    "DevBy": devBy == null ? null : devBy,
  };
}
