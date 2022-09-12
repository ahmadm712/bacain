import 'package:bacain/features/carousel/presentation/widgets/carousel_section.dart';
import 'package:bacain/features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:bacain/l10n/locale_keys.g.dart';
import 'package:bacain/presentation/widgets/app_bar_primary.dart';
import 'package:bacain/presentation/widgets/list_shoes.dart';
import 'package:bacain/presentation/widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    getToken() async {
      final token = await FirebaseMessaging.instance.getToken();
      print('${token} ini token');
    }

    getToken().then((value) => print('${value} ini token'));
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
          const CarouselSection(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.ShoesTitle.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ListShoes(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
