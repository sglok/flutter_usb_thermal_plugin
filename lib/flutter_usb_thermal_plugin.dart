
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_usb_thermal_plugin/model/usb_device_model.dart';

import 'flutter_usb_thermal_plugin_platform_interface.dart';

class FlutterUsbThermalPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterUsbThermalPluginPlatform.instance.getPlatformVersion();
  }

  Future<List<UsbDevice>> getUSBDeviceList()async{
    List<Map<String, dynamic>> deviceMapsList = await FlutterUsbThermalPluginPlatform.instance.getUSBDeviceList();
    debugPrint('getUSBDeviceList debug: deviceMapsList=$deviceMapsList');
    List<UsbDevice> usbDevicesList = [];
    if(deviceMapsList.isNotEmpty){
      for(Map<String, dynamic> map in deviceMapsList){
        usbDevicesList.add(UsbDevice.fromMap(map));
      }
    }

    return usbDevicesList;
  }
  Future<bool?> connect(int vendorId, int productId){
    return FlutterUsbThermalPluginPlatform.instance.connect(vendorId, productId);
  }

  Future<bool?> close(){
    return FlutterUsbThermalPluginPlatform.instance.close();
  }

  Future<bool?> printText(String text){
    return FlutterUsbThermalPluginPlatform.instance.printText(text);
  }

  Future<bool?> printRawText(String text){
    return FlutterUsbThermalPluginPlatform.instance.printRawText(text);
  }

  Future<bool?> write(Uint8List data){
    return FlutterUsbThermalPluginPlatform.instance.write(data);
  }
}
