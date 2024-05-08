




import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pooja_for_everyone/Controllers/User_Address_Controller.dart';
import 'package:pooja_for_everyone/firebase/redirect_user.dart';
import 'package:pooja_for_everyone/view/Pandit/Pandit.dart';
import 'package:pooja_for_everyone/view/Samagrhi/Samagrhi.dart';


import '../../firebase/user_address.dart';
import 'Address_global.dart';

class AddressScreen extends StatelessWidget {
 final String? selectedSection;


  const AddressScreen({super.key,this.selectedSection });

  @override
  Widget build(BuildContext context) {
    final AddressController  addressController = Get.put(AddressController());

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *.08),
              child: Center(
                  child: Image.asset(
                    'assets/back.png',
                    color: Colors.grey.shade200,
                  )),
            ),
            Form(
              key: addressController.formKeyAddress,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height*.03,
                    ),
                   const Center(child: Text("Enter a delivery address",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)),
                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('Please Enter Your Name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.userName, keyboardType:  TextInputType.text, validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Name required';
                      }
                      return null;
                    },),
                   const Row(
                      children: [
                         Padding(
                          padding:  EdgeInsets.only(left: 15.0,top: 15.0,),
                          child: Text('Mobile Number',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0,left: 5),
                          child: Text('(required for delivery purpose) '),
                        ),
                      ],
                    ),
                    addressTextField(controller: addressController.contactNo, maxLength: 10,keyboardType:  TextInputType.number, validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Mobile no. required';
                      }else if (value.length!=10){
                        return 'Please enter a valid no.';
                      }
                      return null;

                    },),

                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('Flat/House no/Building,Company,Apartment',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.houseNo, keyboardType:  TextInputType.text, validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'house no required';
                      }
                      return null;
                    },),

                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('Area,Street,Sector,Village',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.area, keyboardType:  TextInputType.text, validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'area required';
                      }
                      return null;
                    },),

                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('Landmark(optional)',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.landMark, keyboardType:  TextInputType.text, ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('Pincode',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.pinCode, maxLength: 6,keyboardType:  TextInputType.text, validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Pincode required';
                      }else if (value.length != 6){
                        return 'Please type a valid pincode';
                      }
                      return null;
                    },),
                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('Town/City',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.town, keyboardType:  TextInputType.text,),
                    const Padding(
                      padding:  EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0,),
                      child: Text('State',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                    addressTextField(controller: addressController.state, keyboardType:  TextInputType.text,),
                    SizedBox(
                      height: height*.06,
                    ),
                    Center(
                      child: Container(
                        height: height*.07,
                        width: width*.90,
                       // color: Colors.orange,
                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                          onPressed: (){if(
                            addressController.formKeyAddress.currentState!.validate()){
                            userAddress();

                            if(selectedSection=='Pandit'){
                              Get.off(()=> areaPandit());
                            }else if(selectedSection=='Samagrhi'){
                              Get.off(()=> samagrhi());
                            }


                          }

                          },
                            child: const Center(child: Text('Use this Address',style: TextStyle(fontSize: 20),))),
                      ),
                    ),
                    SizedBox(
                      height: height*.06,
                    ),







                  ],
                ),
              ),
            ),
          ],
        )

      ),

    );

  }


}
