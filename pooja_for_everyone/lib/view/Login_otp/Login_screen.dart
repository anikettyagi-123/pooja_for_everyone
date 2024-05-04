import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/Login&otp/Login_controller.dart';


class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *.01),
                child: Center(
                    child: Image.asset(
                      'assets/back.png',
                      color: Colors.grey.shade200,
                    )),
              ),
              Column(
                children: [
                  Form(
                    key: loginController.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Image.asset('assets/nameskar.png',
                        height: MediaQuery.of(context).size.height * .2 ,),
                        Center(child: const Text("Login Here  ",style: TextStyle(fontSize: 25),)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLength: 10,
                            controller: loginController.phoneController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const CountryCodePicker(
                                initialSelection: '+91',
                                showFlagMain: false,
                                textStyle: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              hintText: 'Enter Your Mobile No.',
                              hintStyle: const TextStyle(fontSize: 23),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.length == 10) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Mobile No.';
                              } else if (value.length != 10) {
                                return 'Please Enter Valid Mobile No.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .06,
                    width: MediaQuery.of(context).size.width * .90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        loginController.verifyPhoneNumber();

                        // String number = loginController.phoneController.text+loginController.countryPicker;
                      },
                      child: Center(
                        child: Obx(
                              () => loginController.loading.value
                              ? CircularProgressIndicator(color: Colors.white)
                              : const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // InternetConnect().showDialogBox(context),
            ],
          ),
        ),
      ),
    );
  }
}
