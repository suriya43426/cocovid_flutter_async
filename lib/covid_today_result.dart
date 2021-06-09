// To parse this JSON data, do
//
//     final covidTodayResult = covidTodayResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CovidTodayResult covidTodayResultFromJson(String str) => CovidTodayResult.fromJson(json.decode(str));

String covidTodayResultToJson(CovidTodayResult data) => json.encode(data.toJson());

class CovidTodayResult {
  CovidTodayResult({
    this.confirmed,
    this.recovered,
    this.hospitalized,
    this.deaths,
    this.newConfirmed,
    this.newRecovered,
    this.newHospitalized,
    this.newDeaths,
    this.updateDate,
    this.devBy,
  });

  int? confirmed;
  int? recovered;
  int? hospitalized;
  int? deaths;
  int? newConfirmed;
  int? newRecovered;
  int? newHospitalized;
  int? newDeaths;
  String? updateDate;
  String? devBy;

  factory CovidTodayResult.fromJson(Map<String, dynamic> json) => CovidTodayResult(
    confirmed: json["Confirmed"],
    recovered: json["Recovered"],
    hospitalized: json["Hospitalized"],
    deaths: json["Deaths"],
    newConfirmed: json["NewConfirmed"],
    newRecovered: json["NewRecovered"],
    newHospitalized: json["NewHospitalized"],
    newDeaths: json["NewDeaths"],
    updateDate: json["UpdateDate"],
    devBy: json["DevBy"],
  );

  Map<String, dynamic> toJson() => {
    "Confirmed": confirmed,
    "Recovered": recovered,
    "Hospitalized": hospitalized,
    "Deaths": deaths,
    "NewConfirmed": newConfirmed,
    "NewRecovered": newRecovered,
    "NewHospitalized": newHospitalized,
    "NewDeaths": newDeaths,
    "UpdateDate": updateDate,
    "DevBy": devBy,
  };
}
