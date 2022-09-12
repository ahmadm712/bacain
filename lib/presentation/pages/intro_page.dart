import 'package:bacain/features/list_airport/presentation/pages/home_page.dart';
import 'package:bacain/styles/colors.dart';
import 'package:bacain/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/getwidget.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  late List<Widget> slideList;
  late int initialPage;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFIntroScreen(
        color: Colors.transparent,
        slides: slides(),
        pageController: _pageController,
        currentIndex: initialPage,
        pageCount: 3,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          navigationBarHeight: 60,
          pageController: _pageController,
          pageCount: slideList.length,
          showPagination: true,
          currentIndex: initialPage,
          navigationBarShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backButton: const Icon(
            Icons.navigate_before,
            size: 28,
          ),
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          },
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          },
          onSkipTap: () {
            _pageController.jumpToPage(
              slideList.length,
            );
          },
          doneButton: Container(
              // Icons.done,
              // size: 28,
              ),
          navigationBarColor: Colors.transparent,
          showDivider: false,
          forwardButton: const Icon(
            Icons.navigate_next,
            size: 28,
          ),
          onDoneTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ));
          },
          skipButton: const Icon(
            Icons.skip_next,
          ),
          inactiveColor: Colors.grey,
          activeColor: GFColors.SUCCESS,
          dotHeight: 4,
        ),
      ),
    );
  }

  List<Widget> slides() {
    slideList = [
      GFImageOverlay(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 70.0, left: 20),
              child: Text(
                'Welcome!',
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 25),
              ),
            ),
          ],
        ),
        color: Colors.orange,
        image: const CachedNetworkImageProvider(
          imageUrl,
        ),
        boxFit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
        borderRadius: BorderRadius.circular(5),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          // image: DecorationImage(
          //   image: const AssetImage('assets image here'),
          //   fit: BoxFit.cover,
          //   colorFilter: ColorFilter.mode(
          //       Colors.black.withOpacity(0.2), BlendMode.darken),
          // ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0), color: kColorPrimary
            // image: DecorationImage(
            //   image: const AssetImage('assets image here'),
            //   fit: BoxFit.cover,
            //   colorFilter: ColorFilter.mode(
            //       Colors.black.withOpacity(0.2), BlendMode.darken),
            // ),
            ),
      ),
    ];
    return slideList;
  }
}
