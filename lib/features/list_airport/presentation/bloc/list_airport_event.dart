// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_airport_bloc.dart';

abstract class ListAirportEvent extends Equatable {
  const ListAirportEvent();

  @override
  List<Object> get props => [];
}

class FetchAirport extends ListAirportEvent {
  int page;
  int size;
  FetchAirport({
    this.page = 1,
    this.size = 10,
  });

  @override
  List<Object> get props => [
        page,
        size,
      ];
}

class AirportFetch extends ListAirportEvent {}
