
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pharmacy_app/modules/medicine_card/medicine_card.dart';
import 'package:pharmacy_app/modules/medicine_details/medicine_details_view.dart';

import '../home/home_controller.dart';
import 'medicine_list_controller.dart';


class MedicinesList extends StatelessWidget {
  MedicinesListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue[300],
            title: Text(
              " Fill your pharamcy ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body:Obx(() {
    if (controller.isLoading.isTrue) {
    return Center(
    child: CircularProgressIndicator()
    );
    }
    return ListView.builder(
    itemCount: controller.drugsList.length,
    itemBuilder: (ctx, i) {
    return MedicineCard(
    medicine: controller.drugsList[i],
    onTap: () {
      Get.to(() => MedicineDetails(productdetails: controller.drugsList[i]));
    },
    );
    });
    })  ),
      ),
    );
  }
}
