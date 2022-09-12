import 'package:bacain/utils/constants.dart';
import 'package:flutter/material.dart';

class AppbarPrimary extends StatelessWidget {
  const AppbarPrimary({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: Image.asset(
          '${iconsAsset}icon_drawer.png',
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              '${iconsAsset}icon_search.png',
              color: Colors.black,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }
}
