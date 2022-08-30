// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bacain/utils/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:bacain/features/list_airport/data/datasources/airport_remote_source.dart';
import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:bacain/features/list_airport/domain/repositories/airport_repository.dart';
import 'package:bacain/utils/failures.dart';
import 'package:flutter/services.dart';

class AirportRepositoryImpl implements AirportRepository {
  final AirportRemoteDataSource remoteDataSource;
  AirportRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Airport>>> getListAirport(
    String page,
  ) async {
    try {
      final result = await remoteDataSource.getListAirport(page: page);

      return Right(
        result.map((e) => e.toEntity()).toList(),
      );
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    } on PlatformException {
      return Left(SSLFailure('CONNECTION_NOT_SECURE'));
    }
  }
}
