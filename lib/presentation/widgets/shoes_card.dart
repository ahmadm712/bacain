import 'package:bacain/features/list_airport/domain/entities/airport.dart';
import 'package:bacain/l10n/locale_keys.g.dart';
import 'package:bacain/styles/colors.dart';
import 'package:bacain/utils/global_function.dart';
import 'package:bacain/utils/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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
          CachedNetworkImage(
            imageUrl: airport.airline!.first.logo!,
            width: double.infinity,
            height: 100,
            fit: BoxFit.fitWidth,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                SizedBox(
              height: 20,
              width: 20,
              child: Center(
                child: CircularProgressIndicator.adaptive(
                  value: downloadProgress.progress,
                  strokeWidth: 1,
                  backgroundColor: kColorPrimary,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.AkhenatenName.tr(),
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
