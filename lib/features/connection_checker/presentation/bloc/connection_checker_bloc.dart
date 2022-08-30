import 'package:bacain/features/connection_checker/presentation/helper/network_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connection_checker_event.dart';
part 'connection_checker_state.dart';

class ConnectionCheckerBloc
    extends Bloc<ConnectionCheckerEvent, ConnectionCheckerState> {
  ConnectionCheckerBloc._() : super(ConnectionCheckerInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final ConnectionCheckerBloc _instance = ConnectionCheckerBloc._();

  factory ConnectionCheckerBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected
        ? emit(ConnectionCheckerSucces())
        : emit(ConnectionCheckerFailed());
  }
}
