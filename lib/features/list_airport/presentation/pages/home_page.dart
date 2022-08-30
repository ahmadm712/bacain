import 'package:bacain/features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:bacain/presentation/widgets/app_bar_primary.dart';
import 'package:bacain/presentation/widgets/list_shoes.dart';
import 'package:bacain/presentation/widgets/widgets.dart';
import 'package:bacain/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 0) {
          // scaffoldKey.currentState!.openDrawer();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerHome(),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppbarPrimary(
            scaffoldKey: scaffoldKey,
          ),
        ),
        body: BlocBuilder<ConnectionCheckerBloc, ConnectionCheckerState>(
          builder: (context, state) {
            if (state is ConnectionCheckerSucces) {
              return const HomeWidgets();
            } else if (state is ConnectionCheckerFailed) {
              return const Center(
                child: Text("No Internet Connection :("),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const CarouselShimmer(),
          CarouselSlider(
            options: CarouselOptions(
              height: 170,
              viewportFraction: 1,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(14)),
                    child: Image.asset(
                      '${imageAsset}nike_shoes.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'New Shoes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListShoes(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
