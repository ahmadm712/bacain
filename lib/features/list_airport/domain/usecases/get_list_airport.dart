// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:bacain/features/list_airport/domain/repositories/airport_repository.dart';
import 'package:bacain/utils/failures.dart';
import 'package:dartz/dartz.dart';

class GetListAirport {
  final AirportRepository repository;
  GetListAirport({
    required this.repository,
  });

  Future<Either<Failure, List<Airport>>> execute(String page) {
    return repository.getListAirport(page);
  }
}
