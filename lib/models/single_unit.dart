import 'package:cloud_firestore/cloud_firestore.dart';

class SingleUnit {
  late String voltage;
  late String diameter;
  late String length;
  late String price;
  late String watts;

  SingleUnit(
      {required this.voltage,
        required this.diameter,
        required this.length,
        required this.price,
        required this.watts});

  SingleUnit.fromJson(Map<String, dynamic> json)
      : voltage = json['voltage'] as String,
        diameter = json['diameter'] as String,
        length = json['length'] as String,
        price = json['price'] as String,
        watts = json['watts'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'voltage': voltage,
    'diameter': diameter,
    'length': length,
    'price': price,
    'watts': watts
  };

  SingleUnit.fromDocument(DocumentSnapshot document) {
    voltage = document['voltage'];
    diameter = document['diameter'];
    length = document['length'];
    price = document['price'];
    watts = document['watts'];
  }
}
