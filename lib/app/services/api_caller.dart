import 'package:http/http.dart';
import 'dart:convert';
import 'package:logger/logger.dart';

class ApiCaller {
  static final Logger _logger = Logger();
  static Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url);
      Response response = await get(
        uri,
        headers: {
          //'token': AuthController.accessToken ?? ''
          },
      );
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        // Handle unauthorized access
        await _moveToLogin();
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: 'Unauthorized access. Please log in again.',
          responseData: null,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  static void _logRequest(String url) {
    _logger.i('URL => $url');
  }

  static void _logResponse(String url, Response response) {
    _logger.i(
      'URL => $url\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }

  static Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequestWithBody(url, body: body);
      Response response = await post(
        uri,
        headers: {
          'content-type': 'application/json',
          //'token': AuthController.accessToken ?? '',
        },
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        // Handle unauthorized access
        await _moveToLogin();
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: 'Unauthorized access. Please log in again.',
          responseData: null,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  static void _logRequestWithBody(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'URL => $url\n'
      'Request Body: $body',
    );
  }

  static Future<void> _moveToLogin() async {
    // Implement navigation to login screen
    /*await AuthController.clearUserData();
    Navigator.pushNamedAndRemoveUntil(
      // Replace with your login screen route
      TaskManagerApp.navigatorKey.currentContext!,
      LoginScreen.routeName,
      (predicate) => false,
    );*/
  }

}

class ApiResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic responseData;
  final String? errorMessage;

  ApiResponse({
    required this.isSuccess,
    required this.responseCode,
    required this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}
