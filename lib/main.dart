import 'package:bacain/features/list_airport/presentation/bloc/list_airport_bloc.dart';
import 'package:bacain/features/list_airport/presentation/pages/home_page.dart';
import 'package:bacain/observer.dart';
import 'package:bacain/styles/styles.dart';
import 'package:bacain/utils/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/connection_checker/presentation/bloc/connection_checker_bloc.dart';

void main() {
  init();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final listAirportbloc = locator<ListAirportBloc>();
  final connectionBloc = locator<ConnectionCheckerBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return listAirportbloc
              ..add(
                AirportFetch(),
              );
          },
          child: Container(),
        ),
        BlocProvider(
          create: (context) => connectionBloc..add(NetworkObserve()),
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'Bacain',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: textTheme,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
            primary: kColorPrimary,
          ),
        ),
        home: const Homepage(),
      ),
    );
  }
}
