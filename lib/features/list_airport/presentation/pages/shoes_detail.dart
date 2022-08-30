import 'package:flutter/material.dart';

class ShoesDetailPage extends StatelessWidget {
  const ShoesDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! >= 0) {
          Navigator.pop(context);
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Shoes Detail'),
        ),
      ),
    );
  }
}
