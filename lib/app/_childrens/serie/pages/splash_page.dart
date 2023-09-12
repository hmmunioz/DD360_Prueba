import 'package:dacodes_test/app/_childrens/serie/pages/series_page.dart';
import 'package:dacodes_test/app/constants/assets.dart';
import 'package:dacodes_test/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      changeLocale(context, "es_ES");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          gradient: const LinearGradient(
            colors: [
              ColorsMarvel.marvelPrimary,
              ColorsMarvel.marvelSecondary,
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
              height: 200,
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
            SizedBox(height: size.height * .03),
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
                primary: ColorsMarvel.marvelPrimary,
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
    );
  }
}
