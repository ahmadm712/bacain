import 'package:bacain/common/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroScreenTwo extends StatefulWidget {
  const IntroScreenTwo({Key? key}) : super(key: key);

  @override
  State<IntroScreenTwo> createState() => _IntroScreenTwoState();
}

class _IntroScreenTwoState extends State<IntroScreenTwo> {
  double currentPage = 0.0;
  final _pageViewController = PageController();

  List<Widget> slides = items.map((e) => Container()).toList();
  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
