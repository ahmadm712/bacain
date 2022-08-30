import 'package:bacain/features/list_airport/presentation/pages/shoes_detail.dart';
import 'package:bacain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  print('object');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShoesDetailPage(),
                      ));
                },
                child: const GFAvatar(
                  size: 80,
                  backgroundImage: AssetImage(
                    '${imageAsset}jon_cena.png',
                  ),
                  shape: GFAvatarShape.circle,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Ahmad Mujis',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Logout',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
