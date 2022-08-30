import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ShoesCardshimmer extends StatelessWidget {
  const ShoesCardshimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFShimmer(
        mainColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.19,
            ),
            color: Colors.white38,
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
          height: 200,
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.white60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 12,
                      color: Colors.white60,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 8,
                      color: Colors.white60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
