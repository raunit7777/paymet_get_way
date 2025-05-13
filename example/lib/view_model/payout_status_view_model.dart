import 'package:flutter/foundation.dart';
import 'package:paymet_get_way_example/models/payout_data_model.dart';
import 'package:paymet_get_way_example/repo/payout_status_repo.dart';
import '../utils/utils.dart';

class MerchantPayoutHistoryViewModel with ChangeNotifier {
  final _repo = MerchantPayoutHistoryRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PayoutDataModel? _courseviewList;
  PayoutDataModel? get courseviewList => _courseviewList;

  void viewCourseList(PayoutDataModel v) {
    _courseviewList = v;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchPayoutHistory({

    String? orderId,
  }) async {
    setLoading(true);
    try {
      final result = await _repo.getPayoutHistory(
        merchantId: "04",
        token: "bLrxkljk4mBpPaWvdmH8VJt1N3Z1WcyV",
        orderId: orderId,
      );

      if (result.status == 200) {
        viewCourseList(result);

      } else {
        Utils.toastMessage("Failed to fetch data.");
        print("❌ API returned non-success status");
      }
    } catch (e) {
      Utils.toastMessage("Something went wrong while fetching payout history.");
      print("❌ Exception: $e");
    } finally {
      setLoading(false);
    }
  }
}
