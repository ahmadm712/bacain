import 'package:bacain/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:bacain/presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
