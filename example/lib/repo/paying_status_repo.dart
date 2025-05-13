import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paymet_get_way_example/res/app_urls.dart';

class PayinStatusRepository {
  Future<Map<String, dynamic>> getPayinStatus(String orderId) async {
    final url = Uri.parse(AppUrl.payinStatus+"$orderId");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch Payin Status");
    }
  }
}
