import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? name;
  String? description;
  String? price;
  Timestamp? dateTime;

  Product({this.name, this.description, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    name = json["name"] as String;
    description = json["description"] as String;
    price = json["price"] as String;
    dateTime = json["dateTime"] as Timestamp;
  }
}
