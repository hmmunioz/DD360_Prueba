import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_notifier.dart';

class DarkModeButton extends StatefulWidget {
  const DarkModeButton({
    Key? key,
  }) : super(key: key);

  @override
  DarkModeButtonState createState() => DarkModeButtonState();
}

class DarkModeButtonState extends State<DarkModeButton> {
  _onChange() {
    Provider.of<ThemeNotifier>(context, listen: false).setThemeMode(null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onChange,
      child: Icon(
        Icons.dark_mode,
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }
}
