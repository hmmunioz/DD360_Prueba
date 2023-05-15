import 'dart:convert' show utf8;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

String addHashKeys({String uri = ""}) {
  String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
  return uri +
      "apikey=${dotenv.env['PUBLIC_KEY'] ?? ''}&hash=${generateMD5Hash(
        timeStamp,
        dotenv.env['PRIVATE_KEY'] ?? '',
        dotenv.env['PUBLIC_KEY'] ?? '',
      )}&ts=$timeStamp";
}

String generateMD5Hash(
  String timeStamp,
  String privateKey,
  String publicKey,
) {
  String concatenatedString = timeStamp + privateKey + publicKey;
  var bytes = utf8.encode(concatenatedString);
  var md5Hash = md5.convert(bytes);
  return md5Hash.toString();
}
