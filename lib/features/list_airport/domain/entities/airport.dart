import 'package:bacain/features/list_airport/domain/entities/airline.dart';
import 'package:equatable/equatable.dart';

class Airport extends Equatable {
  Airport({
    this.id,
    this.name,
    this.trips,
    this.airline,
    this.v,
  });

  String? id;
  String? name;
  int? trips;
  List<Airline>? airline;
  int? v;

  @override
  List<Object?> get props => [
        airline,
        id,
        name,
        trips,
        v,
      ];
}
