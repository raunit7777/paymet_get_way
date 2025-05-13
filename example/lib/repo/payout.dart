import 'package:flutter/foundation.dart';
import 'package:paymet_get_way_example/helper/network/base_api_services.dart';
import 'package:paymet_get_way_example/helper/network/network_api_services.dart';
import 'package:paymet_get_way_example/res/app_urls.dart';


class PayoutRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> payoutApi(dynamic data) async {
    try {
      if (kDebugMode) {
        print('Payin API URL: ${AppUrl.payin}');
        print('Payin API Data: $data');
      }

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.payin, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during payinApi: $e');
      }
      rethrow;
    }
  }



}
