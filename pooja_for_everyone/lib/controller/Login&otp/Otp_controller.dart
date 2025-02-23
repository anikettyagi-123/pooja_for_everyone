
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {

  var loading = false.obs;
  final verifyOtpController = TextEditingController();
  var resendTime = 30.obs;
  late Timer countDownTimer;
  addZero(n) => n.toString().padLeft(2, '0');




  void setLoading(bool value) {
    loading.value = value;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    verifyOtpController.clear();
    verifyOtpController.dispose();
  }

  startTimer() {
    resendTime.value = 30;
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {

      if (resendTime > 0) {
        resendTime--;
      } else {
        countDownTimer.cancel();
      }

    });
  }

  stopTimer() {
    if (countDownTimer.isActive) {
      countDownTimer.cancel();
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }



}
