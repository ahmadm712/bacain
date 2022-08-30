// To parse this JSON data, do
//
//     final airportResponse = airportResponseFromJson(jsonString);

import 'dart:convert';

import 'package:bacain/features/list_airport/data/models/airport_model.dart';

AirportResponse airportResponseFromJson(String str) =>
    AirportResponse.fromJson(json.decode(str));

String airportResponseToJson(AirportResponse data) =>
    json.encode(data.toJson());

class AirportResponse {
  AirportResponse({
    this.totalPassengers,
    this.totalPages,
    this.data,
  });

  int? totalPassengers;
  int? totalPages;
  List<AirportModel>? data;

  factory AirportResponse.fromJson(Map<String, dynamic> json) =>
      AirportResponse(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<AirportModel>.from(
            json["data"].map((x) => AirportModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(
          data!.map((x) => x.toJson()),
        ),
      };
}
