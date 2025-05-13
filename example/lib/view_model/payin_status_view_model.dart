import 'package:flutter/foundation.dart';
import 'package:paymet_get_way_example/models/payin_data_model.dart';
import '../repo/paying_status_repo.dart';
import '../utils/utils.dart';

class PayinStatusViewModel with ChangeNotifier {
  final _repo = PayinStatusRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  PayinDataModel? _courseviewList;
  PayinDataModel? get courseviewList => _courseviewList;

  void viewCourseList(PayinDataModel v) {
    _courseviewList = v;
    notifyListeners();
  }

  Future<void> checkPayinStatus(String orderId) async {
    setLoading(true);

    _repo.getPayinStatus(orderId).then((result) {
      setLoading(false);

      if (result['status'] == 'success') {
        print("✅ Payin Success: $result");

        PayinDataModel model = PayinDataModel(
          transactionid: result['transactionid'],
          amount: result['amount'],
          date: result['date'],
          vpa: result['vpa'],
          utr: result['utr'],
        );

        viewCourseList(model);
        Utils.toastMessage("Transaction Success: ₹${model.amount}");

      } else {
        String message = result['message'] ?? "Transaction failed.";
        Utils.toastMessage(message);
        print("❌ Payin Failed: $message");
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      print("❌ API Error: $error");
      Utils.toastMessage("Something went wrong. Please try again.");
    });
  }
}
