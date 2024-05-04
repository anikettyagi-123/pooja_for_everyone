

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{
  final userName =  TextEditingController();
  final houseNo =  TextEditingController();
  final area =  TextEditingController();
  final landMark =  TextEditingController();
  final pinCode =  TextEditingController();
  final town =  TextEditingController();
  final state =  TextEditingController();
  final formKeyAddress = GlobalKey<FormState>();


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    userName.dispose();
    houseNo.dispose();
    area.dispose();
    landMark.dispose();
    pinCode.dispose();
    town.dispose();
    state.dispose();





  }



}