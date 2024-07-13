# flutter_usb_thermal_plugin

This plugin will allow develop send data and work with usb printer on android

## Getting Started
```
    flutter pub add flutter_usb_thermal_plugin
```


## Example of Usage

```
FlutterUsbThermalPlugin flutterUsbPrinter = FlutterUsbThermalPlugin();

....


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
    } on PlatformException {
      //response = 'Failed to get platform version.';
    }
  }

```

## FAQ Support


## Thanks For
- [flutter_usb_printer](https://github.com/kechankrisna/flutter_usb_printer)

