import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_app/models/drug.dart';
import 'package:pharmacy_app/modules/medicine_card/medicine_card_controller.dart';


class MedicineDetails extends StatelessWidget {
  MedicineDetails({super.key, required this.productdetails}) {
    Get.put(MedicineCardController(productdetails.quantity.obs),
        tag: productdetails.tradeName);
  }
  final Drug productdetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 210, 214),
        title: Text(
          "Information about the product",
          style: TextStyle(color: Colors.blue[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Trade Name :",
                  style: TextStyle(fontSize: 20.sp, color: Colors.indigo),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                productdetails.tradeName,
                style: TextStyle(fontSize: 20.sp),
              )
            ],
          ),
          Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                "Scientific Name :",
                style: TextStyle(fontSize: 20.sp, color: Colors.indigo),
              ),
            ),
            Text(productdetails.scienName!,
                style: TextStyle(fontSize: 20.sp)),
          ]),

          Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                "Company :",
                style: TextStyle(fontSize: 20.sp, color: Colors.indigo),
              ),
            ),
            Text(productdetails.company!, style: TextStyle(fontSize: 20.sp)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                "expiration Date :",
                style: TextStyle(fontSize: 20.sp, color: Colors.indigo),
              ),
            ),
    Text(DateFormat('yyyy-MM-dd').format(productdetails.expiryDate),
                style: TextStyle(fontSize: 20.sp)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                "quantity :",
                style: TextStyle(fontSize: 20.sp, color: Colors.indigo),
              ),
            ),
            Text("${productdetails.quantity}",
                style: TextStyle(fontSize: 20.sp)),
          ]),
          Row(children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                "price :",
                style: TextStyle(fontSize: 20.sp, color: Colors.indigo),
              ),
            ),
            Text("${productdetails.price}", style: TextStyle(fontSize: 20.sp)),
          ]),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.h),
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(productdetails.drugsImage)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
