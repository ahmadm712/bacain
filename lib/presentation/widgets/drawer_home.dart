import 'package:bacain/features/list_airport/presentation/pages/shoes_detail.dart';
import 'package:bacain/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  List<String> allLanguage = [
    'Indonesia',
    'English',
    'Villareal',
    'Manchester City'
  ];
  String dropdownValue = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    bool isEng = true;
    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoesDetailPage(),
                    ));
              },
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: GFAvatar(
                  backgroundColor: Colors.transparent,
                  size: 80,
                  backgroundImage: AssetImage(
                    '${imageAsset}jon_cena.png',
                  ),
                  shape: GFAvatarShape.circle,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Ahmad Muji',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(20),
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  padding: const EdgeInsets.all(15),
                  borderRadius: BorderRadius.circular(5),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Colors.white,
                  value: dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue as String;
                    });
                    switch (dropdownValue) {
                      case 'Indonesia':
                        context.setLocale(const Locale('id'));
                        break;
                      case 'English':
                        context.setLocale(const Locale('en'));
                        break;
                      default:
                        context.setLocale(const Locale('id'));
                    }
                  },
                  items: allLanguage
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
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
