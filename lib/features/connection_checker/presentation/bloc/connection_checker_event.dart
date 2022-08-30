// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connection_checker_bloc.dart';

abstract class ConnectionCheckerEvent extends Equatable {
  const ConnectionCheckerEvent();

  @override
  List<Object> get props => [];
}

class NetworkObserve extends ConnectionCheckerEvent {}

class NetworkNotify extends ConnectionCheckerEvent {
  final bool isConnected;
  const NetworkNotify({
    this.isConnected = false,
  });

  @override
  List<Object> get props => [
        isConnected,
      ];
}
