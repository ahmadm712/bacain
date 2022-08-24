import 'package:bacain/styles/colors.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorPrimary,
        title: const Text('Bacain'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: const Text('data'),
                  onTap: () => print('object'),
                ),
                InkWell(
                  child: const Text('data'),
                  onTap: () => print('object'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
