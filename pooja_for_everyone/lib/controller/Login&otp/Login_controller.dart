
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../global/Utils.dart';
import '../../view/Login_otp/Otp_verification.dart';

class LoginController extends GetxController {
  var loading = false.
  obs;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final auth = FirebaseAuth.instance;
  var countryPicker = '+91';
  String? selectedSection;




  void verifyPhoneNumber() {
    // loading.value = true;
    if (formKey.currentState!.validate()) {
      loading.value = true;
      auth.verifyPhoneNumber(
        phoneNumber: countryPicker + phoneController.text,
        verificationCompleted: (_) {
          loading.value = false;
        },
        verificationFailed: (FirebaseAuthException e) {
          String errorMessage = e.message ?? 'Verification failed!';
          Utils().toastMessage(errorMessage.toString());
          loading.value = false;

          // Handle verification failed
        },
        codeSent: (String verification, int? token) {

          loading.value = false;

          Get.off(() => VerifyOtp(
              verification: verification,
              phoneNumberfetch: phoneController.text,
            selectedSection: selectedSection,

            //countryPicker + phoneController.text,kjh
          ));
        },
        codeAutoRetrievalTimeout: (String verificatrionId) {
          // String errorMessage = 'Verification code retrieval timeout!';

          // utils().toastMessage(errorMessage.toString());
          loading.value = false;

        },
      );
    }
  }

  @override
  void dispose() {

    phoneController.clear();
    phoneController.dispose();
    super.dispose();
  }

}