import 'dart:convert';
import 'package:http/http.dart';
import '../../http/web_client.dart';

const String baseUrl = "https://gist.githubusercontent.com/camposFabio/";

const Map<String, String> folder = {
  "en":
      "95378de70f57449f18427ddf498f38ff/raw/12ce0900c414a16c2319419b11af7da8e646e710/",
  "pt":
      "9b62b29969bd48840c72d143bd742584/raw/99e0242376893e41791371496cdef04b3dbfabc7/"
};

class I18nWebClient {
  final String _viewKey;
  final String _locale;

  I18nWebClient({required String viewKey, required String locale})
      : _viewKey = viewKey,
        _locale = folder.containsKey(locale) ? locale : "en";

  Future<Map<String, dynamic>> findAll() async {
    final String messagesUrl = baseUrl +
        (folder[_locale] ?? "en") +
        _viewKey +
        "_" +
        _locale +
        ".json";

    var url = Uri.parse(messagesUrl);
    final Response response = await client.get(url);

    final Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson;
  }
}
