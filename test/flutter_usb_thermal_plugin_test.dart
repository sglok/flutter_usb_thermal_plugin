import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_usb_thermal_plugin/flutter_usb_thermal_plugin.dart';
import 'package:flutter_usb_thermal_plugin/flutter_usb_thermal_plugin_platform_interface.dart';
import 'package:flutter_usb_thermal_plugin/flutter_usb_thermal_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterUsbThermalPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterUsbThermalPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> close()=>Future.value(true);

  @override
  Future<bool?> connect(int vendorId, int productId)=>Future.value(true);

  @override
  Future<List<Map<String, dynamic>>> getUSBDeviceList() 
    =>Future.value([
      {
        'productName':'Thermal Printer',
        'manufacturer':'Mock',
        'vendorId':'123',
        'productId':'456',
      }
    ]);

  @override
  Future<bool?> printRawText(String text)=>Future.value(true);

  @override
  Future<bool?> printText(String text)=>Future.value(true);

  @override
  Future<bool?> write(Uint8List data)=>Future.value(true);
}

void main() {
  final FlutterUsbThermalPluginPlatform initialPlatform = FlutterUsbThermalPluginPlatform.instance;

  test('$MethodChannelFlutterUsbThermalPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterUsbThermalPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterUsbThermalPlugin flutterUsbThermalPlugin = FlutterUsbThermalPlugin();
    MockFlutterUsbThermalPluginPlatform fakePlatform = MockFlutterUsbThermalPluginPlatform();
    FlutterUsbThermalPluginPlatform.instance = fakePlatform;

    expect(await flutterUsbThermalPlugin.getPlatformVersion(), '42');
  });

  test('getUSBDeviceList', () async {
    FlutterUsbThermalPlugin flutterUsbThermalPlugin = FlutterUsbThermalPlugin();
    MockFlutterUsbThermalPluginPlatform fakePlatform = MockFlutterUsbThermalPluginPlatform();
    FlutterUsbThermalPluginPlatform.instance = fakePlatform;
    Map<String, dynamic> device = {
        'productName':'Thermal Printer',
        'manufacturer':'Mock',
        'vendorId':'123',
        'productId':'456',
      };
    expect(await flutterUsbThermalPlugin.getUSBDeviceList(), [device]);
  });
}
