import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'paymet_get_way_method_channel.dart';

abstract class PaymetGetWayPlatform extends PlatformInterface {
  /// Constructs a PaymetGetWayPlatform.
  PaymetGetWayPlatform() : super(token: _token);

  static final Object _token = Object();

  static PaymetGetWayPlatform _instance = MethodChannelPaymetGetWay();

  /// The default instance of [PaymetGetWayPlatform] to use.
  ///
  /// Defaults to [MethodChannelPaymetGetWay].
  static PaymetGetWayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PaymetGetWayPlatform] when
  /// they register themselves.
  static set instance(PaymetGetWayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
