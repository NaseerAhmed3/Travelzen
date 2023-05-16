import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  // final ValueChanged<String> onChanged;
  // final TextEditingController controller;
  // final FormFieldValidator validate;
  final picons;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    // required this.onChanged,
    // required this.controller,
    // required this.validate,
    required this.picons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 330,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(50),
      //   border: BorderSide()
      // ),
      child: TextFormField(
        // onChanged: onChanged,
        controller: TextEditingController(),
        // validator: validate,
        decoration: InputDecoration(
          suffixIcon: Icon(picons),
          suffixIconColor: Colors.black,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
