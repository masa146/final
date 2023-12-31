

import 'dart:convert';

Drugs drugsFromJson(String str) => Drugs.fromJson(json.decode(str));

String drugsToJson(Drugs data) => json.encode(data.toJson());

class Drugs {
  String message;
  List<Drug> drugs;

  Drugs({
    required this.message,
    required this.drugs,
  });

  factory Drugs.fromJson(Map<String, dynamic> json) => Drugs(
    message: json["message"],
    drugs: List<Drug>.from(json["drugs"].map((x) => Drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
  };
}

class Drug {
  String tradeName;
  String price;
  int quantity;
  int favoire;
  String scienName;
  String drugsImage;
  String company;
  DateTime expiryDate;

  Drug({
    required this.tradeName,
    required this.price,
    required this.quantity,
    required this.favoire,
    required this.scienName,
    required this.drugsImage,
    required this.company,
    required this.expiryDate,
  });

    factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    tradeName: json["trade_name"],
    price: json["price"],
    quantity: json["quantity"],
    favoire: json["favoire"],
    scienName: json["scien_name"],
    drugsImage: json["drugs_image"].replaceAll("127.0.0.1", "192.168.1.103"),
    company: json["company"],
    expiryDate: DateTime.parse(json["expiry_date"]),
  );

  Map<String, dynamic> toJson() => {
    "trade_name": tradeName,
    "price": price,
    "quantity": quantity,
    "favoire": favoire,
    "scien_name": scienName,
    "drugs_image": drugsImage,
    "company": company,
    "expiry_date": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
  };
}

