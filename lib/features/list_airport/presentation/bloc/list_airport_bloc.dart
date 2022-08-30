// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:bacain/features/list_airport/domain/usecases/get_list_airport.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'list_airport_event.dart';
part 'list_airport_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ListAirportBloc extends Bloc<ListAirportEvent, ListAirportState> {
  GetListAirport getListAirport;
  ListAirportBloc(
    this.getListAirport,
  ) : super(const ListAirportInitial()) {
    int page = 1;
    on<AirportFetch>((event, emit) async {
      if (state.hasReachedMaximum) {
        return;
      }

      emit(ListAirportLoading(state.airports, (state is ListAirportInitial)));
      final results = await getListAirport.execute(
        page.toString(),
      );

      results.fold(
        (exception) => emit(
          ListAirportFailed(
            exception.message,
            state.airports,
            state.hasReachedMaximum,
          ),
        ),
        (data) {
          page++;
          final airports = [...state.airports, ...data];
          final hasReachedMaximum = data.isEmpty;
          emit(
            ListAirportHasData(
                data: airports, hasReachedMaximum: hasReachedMaximum),
          );
        },
      );
    });
  }
}
