import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:bacain/utils/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AirportRepository {
  Future<Either<Failure, List<Airport>>> getListAirport(String page);
}
