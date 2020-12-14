import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tos_mobile_core/tos_mobile_core.dart';

void main() {
  const MethodChannel channel = MethodChannel('tos_mobile_core');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TosMobileCore.platformVersion, '42');
  });
}
