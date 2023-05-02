import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import './interceptors/logging_interceptors.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);
