import 'dart:io';

import 'package:dd360_test/app/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarMarvel extends StatelessWidget {
  const AppBarMarvel({
    Key? key,
    required this.text,
    this.exitApp = false,
  }) : super(key: key);
  final String text;
  final bool exitApp;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
          color: Colors.white,
          onPressed: () {
            if (exitApp) {
              exit(0);
            }
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
