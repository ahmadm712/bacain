// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_airport_bloc.dart';

enum AirportStatus { initial, loading, success, failure }

abstract class ListAirportState extends Equatable {
  final List<Airport> airports;
  final bool hasReachedMaximum;
  const ListAirportState({
    this.airports = const <Airport>[],
    required this.hasReachedMaximum,
  });

  @override
  List<Object> get props => [
        airports,
        hasReachedMaximum,
      ];
}

class ListAirportInitial extends ListAirportState {
  const ListAirportInitial()
      : super(
          hasReachedMaximum: false,
        );
}

class ListAirportLoading extends ListAirportState {
  final bool isInitial;
  const ListAirportLoading(
    List<Airport> airports,
    this.isInitial,
  ) : super(
          airports: airports,
          hasReachedMaximum: false,
        );

  @override
  List<Object> get props => [];
}

class ListAirportHasData extends ListAirportState {
  final List<Airport> data;
  final bool hasReachedMaximum;
  const ListAirportHasData({
    required this.data,
    required this.hasReachedMaximum,
  }) : super(
          airports: data,
          hasReachedMaximum: hasReachedMaximum,
        );
  @override
  List<Object> get props => [
        data,
        hasReachedMaximum,
      ];
}

class ListAirportFailed extends ListAirportState {
  final dynamic exception;
  const ListAirportFailed(
    this.exception,
    List<Airport> airports,
    bool hasReachedMaximum,
  ) : super(
          hasReachedMaximum: hasReachedMaximum,
        );

  @override
  List<Object> get props => [
        exception.toString(),
      ];
}
