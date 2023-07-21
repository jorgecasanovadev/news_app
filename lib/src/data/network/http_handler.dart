import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/src/data/network/failure_error_handler.dart';

class HttpHandler {
  final String basePath = dotenv.get('API_BASE_PATH');

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };
    headers['Accept-Language'] = Platform.localeName.split('_')[0];
    return headers;
  }

  Future<Response> get(url) async {
    try {
      Response response;
      Map<String, String> headers = await _getHeaders();
      // log('headers: $headers');
      response = await http
          .get(Uri.parse(basePath + url), headers: headers)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw Failure('EXCEPTIONS.NOT_INTERNET', 408);
      });

      if (response.statusCode == 401) {
        throw Failure('EXCEPTIONS.UNAUTHORIZED', 401);
      } else if (response.statusCode != 200 && response.statusCode != 201) {
        throw Failure('EXCEPTIONS.SERVER_ERROR', 500);
      }

      return response;
    } on SocketException {
      throw Failure('EXCEPTIONS.NOT_INTERNET', 408);
    } on HttpException {
      throw Failure('EXCEPTIONS.NOT_FOUND', 500);
    } on FormatException {
      throw Failure('EXCEPTIONS.INVALID_JSON', 500);
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure('EXCEPTIONS.UNKNOWN', 500);
    }
  }
}
