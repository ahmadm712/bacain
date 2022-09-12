// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bacain/features/carousel/domain/entities/carousel.dart';
import 'package:bacain/features/carousel/domain/repositories/carousel_repository.dart';
import 'package:bacain/utils/failures.dart';
import 'package:dartz/dartz.dart';

class GetCarousel {
  final CarouselRepository repository;
  GetCarousel({
    required this.repository,
  });

  Future<Either<Failure, List<Carousel>>> execute() {
    return repository.getCarousel();
  }
}
