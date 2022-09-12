import 'package:bacain/features/carousel/domain/entities/carousel.dart';
import 'package:bacain/utils/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CarouselRepository {
  Future<Either<Failure, List<Carousel>>> getCarousel();
}
