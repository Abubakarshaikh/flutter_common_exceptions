import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_common_exceptions/flutter_common_exceptions.dart';
import 'package:flutter_common_exceptions/flutter_common_exceptions_platform_interface.dart';
import 'package:flutter_common_exceptions/flutter_common_exceptions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCommonExceptionsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterCommonExceptionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCommonExceptionsPlatform initialPlatform = FlutterCommonExceptionsPlatform.instance;

  test('$MethodChannelFlutterCommonExceptions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCommonExceptions>());
  });

  test('getPlatformVersion', () async {
    FlutterCommonExceptions flutterCommonExceptionsPlugin = FlutterCommonExceptions();
    MockFlutterCommonExceptionsPlatform fakePlatform = MockFlutterCommonExceptionsPlatform();
    FlutterCommonExceptionsPlatform.instance = fakePlatform;

    expect(await flutterCommonExceptionsPlugin.getPlatformVersion(), '42');
  });
}
