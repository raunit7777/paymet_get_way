
import 'paymet_get_way_platform_interface.dart';

class PaymetGetWay {
  Future<String?> getPlatformVersion() {
    return PaymetGetWayPlatform.instance.getPlatformVersion();
  }
}
