import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bacain/common/l10n.dart';
import 'package:bacain/features/list_airport/presentation/bloc/list_airport_bloc.dart';
import 'package:bacain/features/list_airport/presentation/pages/home_page.dart';
import 'package:bacain/observer.dart';
// import 'package:bacain/presentation/pages/image_recognize.dart';
import 'package:bacain/presentation/pages/intro_page.dart';
import 'package:bacain/styles/styles.dart';
import 'package:bacain/utils/injection.dart';
import 'package:bacain/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bacain/features/carousel/presentation/bloc/carousel_bloc.dart';
import 'features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

void main() async {
  init();
  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(
  //   'resource://drawable/notification_icon',
  //   [
  //     // notification icon
  //     NotificationChannel(
  //       defaultColor: Colors.red,
  //       enableLights: true,
  //       channelGroupKey: 'basic_test',
  //       channelKey: 'basic',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       channelShowBadge: true,
  //       importance: NotificationImportance.High,
  //     ),
  //     //add more notification type with different configuration
  //   ],
  // );
  // AwesomeNotifications()
  //     .actionStream
  //     .listen((ReceivedNotification receivedNotification) {
  //   log(receivedNotification.payload!['title'].toString());
  //   //output from local notification click.
  // });
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.instance
  //     .subscribeToTopic("all"); //subscribe firebase message on topic

  // FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessage);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');
  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   print('User granted permission');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   print('User granted provisional permission');
  // } else {
  //   print('User declined or has not accepted permission');
  // }
  runApp(
    EasyLocalization(
      path: 'assets/localization',
      supportedLocales: L10n.all,
      fallbackLocale: L10n.all.first,
      child: MyApp(),
    ),
  );
}

Future<void> firebaseBackgroundMessage(RemoteMessage message) async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    //with image from URL
    backgroundColor: Colors.red,
    color: Colors.red,
    id: 1,
    channelKey: 'basic', //channel configuration key
    title: message.data["title"],
    body: message.data["body"],
    bigPicture: message.data["image"],
    notificationLayout: NotificationLayout.Inbox,
    payload: message.data['data'],
  ));
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
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case recognizeImage:
            // return MaterialPageRoute(
            //     builder: (context) => const ImageRecognize());

            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
        home: const Homepage(),
      ),
    );
  }
}
