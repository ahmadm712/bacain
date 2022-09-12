import 'package:bacain/features/carousel/presentation/bloc/carousel_bloc.dart';
import 'package:bacain/presentation/widgets/shimmer/carousel_shimmer.dart';
import 'package:bacain/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselSection extends StatelessWidget {
  const CarouselSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(
      builder: (context, state) {
        if (state is CarouselLoading) {
          return const CarouselShimmer();
        } else if (state is CarouselHasData) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 170,
              viewportFraction: 1,
            ),
            items: state.data.map((carousel) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      print('Presed');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(14)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        // child: Image.network(
                        //   carousel.image!,
                        //   width: double.infinity,
                        //   height: 200,
                        //   fit: BoxFit.cover,
                        // ),
                        child: CachedNetworkImage(
                          imageUrl: carousel.image!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
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
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else if (state is CarouselFailed) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Container();
      },
    );
  }
}
