import 'package:equatable/equatable.dart';

class Airline extends Equatable {
  Airline({
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
