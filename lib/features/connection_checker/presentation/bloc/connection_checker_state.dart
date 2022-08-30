part of 'connection_checker_bloc.dart';

abstract class ConnectionCheckerState extends Equatable {
  const ConnectionCheckerState();

  @override
  List<Object> get props => [];
}

class ConnectionCheckerInitial extends ConnectionCheckerState {}

class ConnectionCheckerSucces extends ConnectionCheckerState {}

class ConnectionCheckerFailed extends ConnectionCheckerState {}
