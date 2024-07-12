import 'dart:convert';

class UsbDevice {
  final String manufacturer;
  final String productName;
  final String vendorId;
  final String productId;
  UsbDevice({
    required this.manufacturer,
    required this.productName,
    required this.vendorId,
    required this.productId,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'manufacturer': manufacturer,
      'productName': productName,
      'vendorId': vendorId,
      'productId': productId,
    };
  }

  factory UsbDevice.fromMap(Map<String, dynamic> map) {
    return UsbDevice(
      manufacturer: map['manufacturer'] ?? '',
      productName: map['productName'] ?? '',
      vendorId: map['vendorId'] ?? '',
      productId: map['productId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UsbDevice.fromJson(String source) => UsbDevice.fromMap(json.decode(source));
}
