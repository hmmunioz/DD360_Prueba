import 'dart:convert' show utf8;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

Future<Map<String, String>> getHeaders() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  return headers;
}

String decodedUtf8(String text) {
  try {
    return utf8.decode(text.runes.toList()).toString();
  } catch (e) {
    return text;
  }
}

Future changeLocale(BuildContext context, String? localeCode) async {
  if (localeCode != null) {
    await LocalizedApp.of(context)
        .delegate
        .changeLocale(localeFromString(localeCode));

    LocalizationProvider.of(context).state.onLocaleChanged();
  }
}

gotoPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
