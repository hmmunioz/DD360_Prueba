import 'package:dacodes_test/app/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarDacodes extends StatelessWidget {
  const AppBarDacodes({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorsMarvel.marvelPrimary,
    );
  }
}
