
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pooja_for_everyone/view/Login_otp/check_user_login.dart';
//import 'package:struggle/cloud_firestore/user_gernal_mobile_number.dart';


//import 'package:struggle/view/Login_screen.dart';

import '../../Controllers/Login&otp/Otp_controller.dart';
import '../../firebase/Save_User_Mobile_no.dart';
import '../../firebase/redirect_user.dart';
import '../../global/Utils.dart';
//import '../controller/fromGetx.dart';
//import '../global/Utils.dart';

import '../User_Address/Address.dart';
import '../welcome_screen/welcome_Screen.dart';
import 'Login_screen.dart';
//import 'location_screen.dart';

class VerifyOtp extends StatelessWidget {
  final String verification;
  final String phoneNumberfetch;
 // final String? selectedSection;

  VerifyOtp(
      {super.key, required this.verification, required this.phoneNumberfetch,});

  final VerifyController verifyController = Get.put(VerifyController());

  final _formKey2 = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    MobileNo = phoneNumberfetch;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack
              (
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .20),
                  child: Center(
                      child: Image.asset(
                        'assets/back.png',
                        color: Colors.grey.shade200,
                      )),
                ),
                Column(
                  children: [
                    Form(
                        key: _formKey2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            Image.asset('assets/nameskar.png',
                              height: MediaQuery.of(context).size.height * .2 ,),
                            const Text(
                              'Verify Your Mobile Number',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Text(
                              'Otp send to Mobile No',
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  phoneNumberfetch.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginScreen()));
                                    },
                                    child: const Text(
                                      '   Edit',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PinCodeTextField(
                                controller: verifyController.verifyOtpController,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    inactiveColor: Colors.black,
                                    inactiveBorderWidth: 1,
                                    selectedBorderWidth: 1,
                                    activeBorderWidth: 1,
                                    borderRadius: BorderRadius.circular(10)),
                                appContext: context,
                                length: 6,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' Enter Six Digit Code.';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .90,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () async {
                              if (_formKey2.currentState!.validate()) {
                                verifyController.setLoading(true);

                                final credential = PhoneAuthProvider.credential(
                                    verificationId: verification,
                                    smsCode: verifyController
                                        .verifyOtpController.text
                                        .toString());
                                try {
                                  await auth.signInWithCredential(credential);




                                  saveUserMobileNo();
                                 // isLogin(selectedSection);


                                 Get.off(()=> AddressScreen());





                                } on FirebaseAuthException catch (e) {
                                  String errorMessage =
                                      e.message ?? 'Verification failed!';

                                  verifyController.setLoading(false);

                                  Utils().toastMessage(errorMessage.toString());
                                }
                              }
                            },
                            child: Center(
                                child: Obx(() => verifyController.loading.value
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : const Text(
                                  'Verify',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ))),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .009,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Resend Otp in ',
                              style: TextStyle(fontSize: 17),
                            ),
                            Obx(
                                  () => verifyController.resendTime.value == 0
                                  ? InkWell(
                                  onTap: () {
                                    verifyController.startTimer();
                                    auth.verifyPhoneNumber(
                                        phoneNumber: phoneNumberfetch,
                                        verificationCompleted: (_) {},
                                        verificationFailed:
                                            (FirebaseAuthException e) {
                                          String errorMessage = e.message ??
                                              'Verification failed!';
                                          Utils().toastMessage(
                                              errorMessage.toString());
                                        },
                                        codeSent: (String verification,
                                            int? token) {},
                                        codeAutoRetrievalTimeout:
                                            (String verificatrionId) {
                                          // String errorMessage = 'Verification code retrieval timeout!';
                                          //
                                          // utils().toastMessage(errorMessage.toString());
                                        });
                                  },
                                  child: const Text(
                                    ' Resend',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.blue),
                                  ))
                                  : Text(
                                '${verifyController.addZero(verifyController.resendTime)} ',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
