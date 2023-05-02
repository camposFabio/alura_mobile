import 'dart:convert';
import 'package:http/http.dart';
import '../../http/web_client.dart';
import '../../models/models.dart';

const String baseUrl = 'http://192.168.31.110:8080/transactions';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    var url = Uri.parse(baseUrl);
    final Response response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);

      return decodedJson
          .map((dynamic json) => Transaction.fromJson(json))
          .toList();
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  Future<Transaction?> save(
      {required Transaction transaction, String? password}) async {
    var url = Uri.parse(baseUrl);

    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(url,
        headers: {
          'Content-type': 'application/json',
          'password': password ?? '',
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown Error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error submitting transaction',
    401: 'Authentication failed!',
    409: 'Transaction already exists!'
  };
}

class HttpException implements Exception {
  final String? message;

  HttpException(this.message);
}
