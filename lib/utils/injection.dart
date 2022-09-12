import 'package:bacain/features/carousel/data/datasources/carousel_remote_source.dart';
import 'package:bacain/features/carousel/data/repositories/carousel_repositpory_impl.dart';
import 'package:bacain/features/carousel/domain/repositories/carousel_repository.dart';
import 'package:bacain/features/carousel/domain/usecases/get_carousel.dart';
import 'package:bacain/features/carousel/presentation/bloc/carousel_bloc.dart';
import 'package:bacain/features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:bacain/features/list_airport/data/datasources/airport_remote_source.dart';
import 'package:bacain/features/list_airport/data/dummy/shoes_model.dart';
import 'package:bacain/features/list_airport/data/repositories/airport_repository_impl.dart';
import 'package:bacain/features/list_airport/domain/repositories/airport_repository.dart';
import 'package:bacain/features/list_airport/domain/usecases/get_list_airport.dart';
import 'package:bacain/features/list_airport/presentation/bloc/list_airport_bloc.dart';
import 'package:bacain/utils/global_function.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => ShoesDummyModel);
  // locator.registerLazySingleton(() => AirportRepository);
  // locator.registerLazySingleton(() => ListAirportBloc(locator()));
  // Bloc
  locator.registerFactory(() => ListAirportBloc(locator()));
  locator.registerFactory(() => ConnectionCheckerBloc());
  locator.registerFactory(() => CarouselBloc(locator()));
  // Use case
  locator.registerLazySingleton(() => GetListAirport(repository: locator()));
  locator.registerLazySingleton(() => GetCarousel(repository: locator()));

  // Repository impl
  locator.registerLazySingleton<AirportRepository>(
      () => AirportRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<CarouselRepository>(
      () => CarouselRepositoryImpl(remoteDataSource: locator()));

  // Airport data sources
  locator.registerLazySingleton<AirportRemoteDataSource>(
      () => AirportRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton<CarouselRemoteDataSource>(
      () => CarouselRemoteDataImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());

  //Other
  locator.registerFactory(() => GlobalFunction());
}
