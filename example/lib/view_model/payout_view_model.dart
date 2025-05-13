import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:paymet_get_way_example/repo/payin_repo.dart';
import '../utils/utils.dart';

class PayoutViewModel with ChangeNotifier {
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
      dynamic ifsc,
      dynamic bank,
      dynamic account,
      BuildContext context,
      ) async {
    setLoading(true);

    // Step 1: Prepare payout data
    Map<String, String> payoutData = {
      "merchant_id": "",
      "merchant_token": "",
      "account_no": account,
      "ifsccode": ifsc,
      "amount": amount,
      "bankname": bank,
      "remark": remark,
      "orderid": orderId,
      "name": name,
      "contact": mobile,
      "email": email,
    };

    // Step 2: Encode payout data to Base64
    String encodedPayoutData = base64Encode(utf8.encode(jsonEncode(payoutData)));
    print('📦 Encoded Payout Data: $encodedPayoutData');

    // Step 3: Prepare API body with "salt" key
    Map<String, String> saltData = {
      "salt": encodedPayoutData,
    };
print(jsonEncode(saltData));
    // Step 4: Call API with encoded salt data
    _authRepo.payinApi(saltData).then((value) {
      setLoading(false);

      if (value['status'] == 'SUCCESS') {
        print('✅ Payment Success: $value');
        // Success handling
      } else {
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
