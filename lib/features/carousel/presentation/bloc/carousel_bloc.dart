// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bacain/features/carousel/domain/entities/carousel.dart';
import 'package:bacain/features/carousel/domain/usecases/get_carousel.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  GetCarousel getCarousel;
  CarouselBloc(
    this.getCarousel,
  ) : super(CarouselInitial()) {
    on<FetchCarousel>((event, emit) async {
      emit(CarouselLoading());
      final result = await getCarousel.execute();

      result.fold(
          (failure) => emit(CarouselFailed(errorMessage: failure.message)),
          (data) => emit(CarouselHasData(data: data)));
    });
  }
}
