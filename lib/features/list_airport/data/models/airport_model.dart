import 'package:bacain/features/list_airport/data/models/airline_model.dart';
import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:equatable/equatable.dart';

class AirportModel extends Equatable {
  AirportModel({
    this.id,
    this.name,
    this.trips,
    this.airline,
    this.v,
  });

  String? id;
  String? name;
  int? trips;
  List<AirlineModel>? airline;
  int? v;

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
        id: json["_id"],
        name: json["name"],
        trips: json["trips"],
        airline: List<AirlineModel>.from(
            json["airline"].map((x) => AirlineModel.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "trips": trips,
        "airline": List<dynamic>.from(airline!.map((x) => x.toJson())),
        "__v": v,
      };

  Airport toEntity() {
    return Airport(
      airline: airline!
          .map(
            (e) => e.toEntity(),
          )
          .toList(),
      id: id,
      name: name,
      trips: trips,
      v: v,
    );
  }

  @override
  List<Object?> get props => [
        airline,
        id,
        name,
        trips,
        v,
      ];
}
