import 'package:bacain/features/list_airport/domain/entities/airline.dart';
import 'package:equatable/equatable.dart';

class AirlineModel extends Equatable {
  AirlineModel({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.slogan,
    this.headQuaters,
    this.website,
    this.established,
  });

  int? id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;
  String? established;

  factory AirlineModel.fromJson(Map<String, dynamic> json) => AirlineModel(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        slogan: json["slogan"],
        headQuaters: json["head_quaters"],
        website: json["website"],
        established: json["established"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "head_quaters": headQuaters,
        "website": website,
        "established": established,
      };

  Airline toEntity() {
    return Airline(
      country: country,
      established: established,
      headQuaters: headQuaters,
      id: id,
      logo: logo,
      name: name,
      slogan: slogan,
      website: website,
    );
  }

  @override
  List<Object?> get props => [
        country,
        established,
        headQuaters,
        id,
        logo,
        name,
        slogan,
        website,
      ];
}
