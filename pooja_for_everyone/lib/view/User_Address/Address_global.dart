import 'package:flutter/material.dart';

class addressTextField extends StatelessWidget {
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;

  addressTextField({
    super.key,
    required this.controller,

    this.validator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.09,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
        child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            validator: validator,
            keyboardType: keyboardType,

              )),
    );
  }
}
