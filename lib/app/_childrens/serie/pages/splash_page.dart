import 'package:dacodes_test/app/_childrens/serie/pages/series_page.dart';
import 'package:dacodes_test/app/common_widgets/dark_mode_button.dart';
import 'package:dacodes_test/app/constants/assets.dart';
import 'package:dacodes_test/app/constants/utils_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_widgets/flag_language.dart';
import '../../../theme/theme_notifier.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver {
  late SharedPreferences prefs;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initPrefs();
    });
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      _changeDarkMode();
      super.didChangePlatformBrightness();
    }
  }

  _changeDarkMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      if (prefs.getString('themeMode') == 'light') {
        Provider.of<ThemeNotifier>(context, listen: false)
            .setThemeMode(ThemeMode.dark);
      }
    } else if (!isDarkMode && prefs.getString('themeMode') == 'dark') {
      Provider.of<ThemeNotifier>(context, listen: false)
          .setThemeMode(ThemeMode.dark);
    }
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _changeDarkMode();
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveBreakpoints.builder(
      breakpoints: UtilsScreen.breakpoints,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).backgroundColor,
                    Theme.of(context).cardColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsUIValues.logoDaCodes,
                    width: 200,
                    height: 100,
                  ),
                  SizedBox(height: size.height * .04),
                  Text(
                    translate('nameUser'),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  Text(
                    translate('wellcome'), // Second text
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height * .05),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeriesPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(translate('enter')),
                        const SizedBox(height: 5),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height * .05,
              left: 10,
              child: const FlagLanguage(),
            ),
            Positioned(
              top: size.height * .08,
              right: 15,
              child: const DarkModeButton(),
            ),
          ],
        ),
      ),
    );
  }
}
