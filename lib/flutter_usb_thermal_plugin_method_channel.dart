import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_usb_thermal_plugin_platform_interface.dart';

/// An implementation of [FlutterUsbThermalPluginPlatform] that uses method channels.
class MethodChannelFlutterUsbThermalPlugin extends FlutterUsbThermalPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_usb_thermal_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /*
  static const MethodChannel _channel =
      const MethodChannel('flutter_usb_printer');
  */
  /// [getUSBDeviceList]
  /// get list of available usb device on android
  @override
  Future<List<Map<String, dynamic>>> getUSBDeviceList() async {
    if (Platform.isAndroid) {
      List<dynamic> devices = await methodChannel.invokeMethod('getUSBDeviceList');
      debugPrint('get usb devices=$devices');
      var result = devices
          .cast<Map<dynamic, dynamic>>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
      return result;
    } else {
      return <Map<String, dynamic>>[];
    }
  }

  /// [connect]
  /// connect to a printer vai vendorId and productId
  @override
  Future<bool?> connect(int vendorId, int productId) async {
    Map<String, dynamic> params = {
      "vendorId": vendorId,
      "productId": productId
    };
    final bool? result = await methodChannel.invokeMethod('connect', params);
    return result;
  }

  /// [close]
  /// close the connection after print with usb printer
  @override
  Future<bool?> close() async {
    final bool? result = await methodChannel.invokeMethod('close');
    return result;
  }

  /// [printText]
  /// print text
  @override
  Future<bool?> printText(String text) async {
    Map<String, dynamic> params = {"text": text};
    final bool? result = await methodChannel.invokeMethod('printText', params);
    return result;
  }

  /// [printRawText]
  /// print raw text
  @override
  Future<bool?> printRawText(String text) async {
    Map<String, dynamic> params = {"raw": text};
    final bool? result = await methodChannel.invokeMethod('printRawText', params);
    return result;
  }

  /// [write]
  /// write data byte
  @override
  Future<bool?> write(Uint8List data) async {
    Map<String, dynamic> params = {"data": data};
    final bool? result = await methodChannel.invokeMethod('write', params);
    return result;
  }
}
