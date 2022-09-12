// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bacain/utils/exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:bacain/features/carousel/data/datasources/carousel_remote_source.dart';
import 'package:bacain/features/carousel/domain/entities/carousel.dart';
import 'package:bacain/features/carousel/domain/repositories/carousel_repository.dart';
import 'package:bacain/utils/failures.dart';
import 'package:flutter/services.dart';

class CarouselRepositoryImpl implements CarouselRepository {
  final CarouselRemoteDataSource remoteDataSource;
  CarouselRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Carousel>>> getCarousel() async {
    try {
      final result = await remoteDataSource.getCarousel();

      return Right(result.map((e) => e.toEntity()).toList());
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
