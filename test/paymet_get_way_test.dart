import 'package:flutter_test/flutter_test.dart';
import 'package:paymet_get_way/paymet_get_way.dart';
import 'package:paymet_get_way/paymet_get_way_platform_interface.dart';
import 'package:paymet_get_way/paymet_get_way_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPaymetGetWayPlatform
    with MockPlatformInterfaceMixin
    implements PaymetGetWayPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PaymetGetWayPlatform initialPlatform = PaymetGetWayPlatform.instance;

  test('$MethodChannelPaymetGetWay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPaymetGetWay>());
  });

  test('getPlatformVersion', () async {
    PaymetGetWay paymetGetWayPlugin = PaymetGetWay();
    MockPaymetGetWayPlatform fakePlatform = MockPaymetGetWayPlatform();
    PaymetGetWayPlatform.instance = fakePlatform;

    expect(await paymetGetWayPlugin.getPlatformVersion(), '42');
  });
}
