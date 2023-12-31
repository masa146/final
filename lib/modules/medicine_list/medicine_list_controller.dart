import 'package:get/get.dart';
import 'package:pharmacy_app/modules/medicine_list/medicines_list_services.dart';

import '../../config/user_information.dart';
import '../../models/category.dart';
import '../../models/drug.dart';

class MedicinesListController extends GetxController{

  List<Drug> drugsList = [];
  MedicinesService service = MedicinesService();
  var isLoading = true.obs;
  @override
  void onInit(){
    super.onInit();
  }
  void onReady() async {
    final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
    final int categoryId = arguments['id'];
    drugsList = await service.getmedicines(UserInformation.userToken, categoryId);
    isLoading(false);
    super.onReady();
  }
}