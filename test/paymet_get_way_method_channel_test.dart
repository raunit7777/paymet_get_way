import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paymet_get_way/paymet_get_way_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPaymetGetWay platform = MethodChannelPaymetGetWay();
  const MethodChannel channel = MethodChannel('paymet_get_way');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
