import 'package:dacodes_test/app/common_widgets/dark_mode_button.dart';
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
          color: Theme.of(context).primaryColorLight,
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
      actions: const [
        Padding(
          padding: EdgeInsets.all(10),
          child: DarkModeButton(),
        )
      ],
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
