import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paymet_get_way_example/models/payout_data_model.dart';

class MerchantPayoutHistoryRepository {
  Future<PayoutDataModel> getPayoutHistory({
    required String merchantId,
    required String token,
    String? orderId,
    int limit = 1000,
  }) async {
    try {
      final uri = Uri.parse(
        'https://indianpay.co.in/admin/merchantpayouthistory'
            '?merchantid=$merchantId'
            '&token=$token'
            '${orderId != null ? '&orderid=$orderId' : ''}'
            '&limit=$limit',
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);


        return PayoutDataModel.fromJson(decodedJson);
      } else {
        throw Exception("Failed to load payout history: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
