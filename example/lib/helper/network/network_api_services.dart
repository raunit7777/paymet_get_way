import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../response/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20
          ));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedExceptions(response.body.toString());
      case 500:
        throw FetchDataExceptions(
            "Internal Server Error: ${response.statusCode}");
      default:
        throw FetchDataExceptions(
            "Error occurred while communicating with server with status code:${response.statusCode}");
    }
  }
}
