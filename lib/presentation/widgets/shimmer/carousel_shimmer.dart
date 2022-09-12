import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFShimmer(
      mainColor: Colors.white,
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
      ),
    );
  }
}
