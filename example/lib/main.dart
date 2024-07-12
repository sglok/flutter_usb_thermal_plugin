import 'package:flutter_usb_thermal_plugin/flutter_usb_thermal_plugin.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_usb_thermal_plugin/model/usb_device_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<UsbDevice> devices = [];
  FlutterUsbThermalPlugin flutterUsbPrinter = FlutterUsbThermalPlugin();
  bool connected = false;

  @override
  initState() {
    super.initState();
    _getDevicelist();
  }

  _getDevicelist() async {
    List<UsbDevice> results = [];
    results = await flutterUsbPrinter.getUSBDeviceList();

    debugPrint(" length: ${results.length}");
    setState(() {
      devices = results;
    });
  }

  _connect(int vendorId, int productId) async {
    bool? returned = false;
    try {
      returned = await flutterUsbPrinter.connect(vendorId, productId);
    } on PlatformException {
      //response = 'Failed to get platform version.';
    }
    if (returned!) {
      setState(() {
        connected = true;
      });
    }
  }

  _print() async {
    try {
      var data = Uint8List.fromList(
          utf8.encode(" Hello world Testing ESC POS printer..."));
      await flutterUsbPrinter.write(data);
      // await FlutterUsbPrinter.printRawData("text");
      // await FlutterUsbPrinter.printText("Testing ESC POS printer...");
    } on PlatformException {
      //response = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('USB PRINTER'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => _getDevicelist()),
            connected == true
                ? IconButton(
                    icon: const Icon(Icons.print),
                    onPressed: () {
                      _print();
                    })
                : Container(),
          ],
        ),
        body: devices.isNotEmpty
            ? ListView(
                scrollDirection: Axis.vertical,
                children: _buildList(devices),
              )
            : null,
      ),
    );
  }

  List<Widget> _buildList(List<UsbDevice> devices) {
    return devices
        .map((device) => ListTile(
              onTap: () {
                _connect(int.parse(device.vendorId),
                    int.parse(device.productId));
              },
              leading: const Icon(Icons.usb),
              title: Text('${device.manufacturer} ${device.productName}'),
              subtitle:
                  Text('${device.vendorId } ${device.productId}'),
            ))
        .toList();
  }
}

