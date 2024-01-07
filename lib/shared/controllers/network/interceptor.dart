import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:web_susch/logger.dart';

FutureOr<Request> loggerRequestInterceptor(Request request) {
  const jsonEncoder = JsonEncoder.withIndent('    ');

  String headers = jsonEncoder.convert(request.headers);
  // headers = headers.substring(1, headers.length - 2);

  String params = jsonEncoder.convert(request.parameters);
  // params = params.substring(1, params.length - 2);

  String body = jsonEncoder.convert(request.body);

  logger.i(
    '''Request
    Url: ${request.url}
    Method: ${request.method}
    Headers: $headers
    Params: $params
    Body: $body''',
  );

  return request;
}
