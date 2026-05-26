import 'dart:ui';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:logger/logger.dart';

part 'package:crafty_bay/app/core/models/network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();
 
  final VoidCallback onUnauthorize;
  final Map<String, String>? headers;


  NetworkCaller({ required this.onUnauthorize, this.headers});
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url);
      Response response = await get(
        uri,
        headers: headers);
 
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        // Handle unauthorized access
        onUnauthorize();
        return NetworkResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: 'Unauthorized access. Please log in again.',
          responseData: null,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url) {
    _logger.i('URL => $url');
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      'URL => $url\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }

   Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequestWithBody(url, body: body);
      Response response = await post(
        uri,
        headers: headers?? {
          'content-type': 'application/json',
           
        },
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        // Handle unauthorized access
        onUnauthorize();
        return NetworkResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: 'Unauthorized access. Please log in again.',
          responseData: null,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequestWithBody(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'URL => $url\n'
      'Request Body: $body',
    );
  }

}

