import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart';
import 'flutter_usb_thermal_plugin_method_channel.dart';

abstract class FlutterUsbThermalPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterUsbThermalPluginPlatform.
  FlutterUsbThermalPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUsbThermalPluginPlatform _instance = MethodChannelFlutterUsbThermalPlugin();

  /// The default instance of [FlutterUsbThermalPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUsbThermalPlugin].
  static FlutterUsbThermalPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUsbThermalPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterUsbThermalPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<List<Map<String, dynamic>>> getUSBDeviceList(){
    throw UnimplementedError('getUSBDeviceList() has not been implemented.');
  }
  Future<bool?> connect(int vendorId, int productId){
    throw UnimplementedError('connect() has not been implemented.');
  }

  Future<bool?> close(){
    throw UnimplementedError('close() has not been implemented.');
  }

  Future<bool?> printText(String text){
    throw UnimplementedError('printText(String) has not been implemented.');
  }

  Future<bool?> printRawText(String text){
    throw UnimplementedError('printRawText(String) has not been implemented.');
  }

  Future<bool?> write(Uint8List data){
    throw UnimplementedError('write(Uint8List) has not been implemented.');
  }
}
