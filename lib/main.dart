import 'package:bacain/common/l10n.dart';
import 'package:bacain/features/list_airport/presentation/bloc/list_airport_bloc.dart';
import 'package:bacain/features/list_airport/presentation/pages/home_page.dart';
import 'package:bacain/observer.dart';
import 'package:bacain/presentation/pages/intro_page.dart';
import 'package:bacain/styles/styles.dart';
import 'package:bacain/utils/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bacain/features/carousel/presentation/bloc/carousel_bloc.dart';
import 'features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

FirebaseMessaging messaging = FirebaseMessaging.instance;

void main() async {
  init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  runApp(
    EasyLocalization(
      path: 'assets/localization',
      supportedLocales: L10n.all,
      fallbackLocale: L10n.all.first,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final listAirportbloc = locator<ListAirportBloc>();
  final connectionBloc = locator<ConnectionCheckerBloc>();
  final carouselBloc = locator<CarouselBloc>();

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
        ),
        BlocProvider(
          create: (context) => carouselBloc..add(FetchCarousel()),
          child: Container(),
        ),
      ],
      child: MaterialApp(
        title: 'Bacain',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
