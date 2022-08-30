import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:bacain/utils/global_function.dart';
import 'package:bacain/utils/injection.dart';
import 'package:flutter/material.dart';

class ShoesCard extends StatelessWidget {
  ShoesCard({Key? key, required this.airport}) : super(key: key);
  Airport airport;
  final globalFunction = locator<GlobalFunction>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.19,
        ),
        color: Colors.white70,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
      height: 40,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            airport.airline!.first.logo!,
            width: double.infinity,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                airport.name ?? "",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Rp ${airport.trips!.toString()}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: airport.airline!
                    .map((e) => Container(
                          child: Text(
                            e.country!.toString(),
                            style: globalFunction
                                .textTheme(context)
                                .headline5!
                                .copyWith(
                                  fontSize: 11,
                                ),
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
