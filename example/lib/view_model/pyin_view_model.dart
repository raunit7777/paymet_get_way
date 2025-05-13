import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:paymet_get_way_example/repo/payin_repo.dart';


import '../utils/utils.dart';

class PayinViewModel with ChangeNotifier {
  final _authRepo = PayinRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> payinApi(
      dynamic orderId,
      dynamic amount,
      dynamic name,
      dynamic email,
      dynamic mobile,
      dynamic remark,
      BuildContext context,
      ) async {
    setLoading(true);

    Map<String, dynamic> paymentData = {
      "merchantid": "04",
      "orderid": orderId,
      "amount": amount,
      "name": name,
      "email": email,
      "mobile": mobile,
      "remark": remark,
      "type": "2",
      "redirect_url": "https://google.com",
    };

    print(jsonEncode(paymentData));

    _authRepo.payinApi(paymentData).then((value) {
      setLoading(false);

      if (value['status'] == 'SUCCESS') {
        print('✅ Payment Success: $value');

        // You can navigate or handle success here
        // Navigator.pushReplacementNamed(context, RoutesName.homeScreen);

      } else {
        // Handle error response
        String errorMessage = value['error'] ?? value['message'] ?? 'Something went wrong';
        print('❌ Payment Failed: $errorMessage');
        Utils.toastMessage(errorMessage);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('❌ API Error: $error');
      }
      Utils.toastMessage("Something went wrong. Please try again.");
    });
  }

}
