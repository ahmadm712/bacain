// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

class CarouselInitial extends CarouselState {}

class CarouselLoading extends CarouselState {}

class CarouselFailed extends CarouselState {
  String errorMessage;
  CarouselFailed({
    required this.errorMessage,
  });
  @override
  List<Object> get props => [errorMessage];
}

class CarouselHasData extends CarouselState {
  List<Carousel> data;
  CarouselHasData({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}
