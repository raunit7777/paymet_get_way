import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'paymet_get_way_platform_interface.dart';

/// An implementation of [PaymetGetWayPlatform] that uses method channels.
class MethodChannelPaymetGetWay extends PaymetGetWayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('paymet_get_way');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
