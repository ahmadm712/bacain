import 'package:bacain/presentation/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  testWidgets('Homepage have an intro screen', (tester) async {
    await tester.pumpWidget(const IntroPage());

    final introFinder = find.byType(GFIntroScreen);

    expect(introFinder, findsWidgets);
  });
}
