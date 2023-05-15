import 'package:dd360_test/app/enums/marvel/superhero_filter_enum.dart';
import 'package:http/http.dart' as http;
import 'package:dd360_test/app/models/result_models/result_marvel_list_model.dart';
import 'package:dd360_test/app/utils/helper.dart';
import 'dart:convert';

class Repository {
  Future<ResultMarvelListModel?> getEntityMarvelApi(
    String uri,
    MarvelEnum marvelEnum, {
    int page = 0,
    int size = 10,
  }) async {
    final finalUri = uri + "?offset=$page&limit=$size&";
    final response = await http.get(Uri.parse(addHashKeys(uri: finalUri)),
        headers: await getHeaders());

    if (response.statusCode == 200) {
      var decodedBody = decodedUtf8(response.body);
      var jsonBody = json.decode(decodedBody);

      return ResultMarvelListModel.fromJson(jsonBody, marvelEnum);
    } else {
      return null;
    }
  }
}
