import 'package:dd360_test/app/_childrens/superheros/pages/superhero_page.dart';
import 'package:dd360_test/app/constants/assets.dart';
import 'package:dd360_test/app/constants/colors.dart';
import 'package:dd360_test/app/constants/texts.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsUIValues.bgMarvel),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsUIValues.logoDD360,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  TextUIValues.nameUser,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  TextUIValues.wellcome, // Second text
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuperheroPage(),
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
                    children: const [
                      Text(TextUIValues.enter),
                      SizedBox(height: 5),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
