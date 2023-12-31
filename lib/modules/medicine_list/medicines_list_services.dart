
import 'package:flutter/gestures.dart';
import 'package:pharmacy_app/config/server_config.dart';
import 'package:http/http.dart ' as http;
import 'package:pharmacy_app/models/category.dart';
import 'package:pharmacy_app/models/drug.dart';
class MedicinesService {



   Uri geturl(int id){
     return Uri.parse(ServerConfiguration.domainNameServer+ServerConfiguration.getMedicines( id));}

  Future<List<Drug>> getmedicines(String token,int id) async{
    var response = await http.get(geturl(id),headers: {
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    });


    if (response.statusCode==200) {
      var drugs = drugsFromJson(response.body);
      return drugs.drugs;
    }
    else{
      print("f");
      return [];
    }
  }

}

