import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

import 'package:vgo_app/Validator/check_phone_number.dart';

@immutable
// ignore: must_be_immutable
class PhoneNumberInput extends StatefulWidget {
  TextEditingController? controller;

  FocusNode? currendNode;
  FocusNode? nextNode;
  Function(String)? onChanged;
  Function(String?)? onSaved;

  PhoneNumberInput({
    Key? key,
    this.controller,
    this.currendNode,
    this.nextNode,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  var isTextFieldValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(signed: true),
      controller: widget.controller,
      onSaved: widget.onSaved,
      onChanged: (value) {
        if (PhoneService.validateMobile(value) == null && value.isNotEmpty) {
          setState(() {
            isTextFieldValid = true;
          });
        } else {
          setState(() {
            isTextFieldValid = false;
          });
        }
      },
      validator: (value) {
        return PhoneService.validateMobile(value!);
      },
      decoration: InputDecoration(
        hintText: '12-345-678',
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
        labelText: 'Phone Number (optional)',
        labelStyle: const TextStyle(fontSize: 12),
        focusColor: Palette.primaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.primaryColor,
            width: 2,
          ),
        ),
        prefixText: "+855 ",
        prefixStyle: const TextStyle(fontSize: 16, color: Colors.black),
        suffixIcon: isTextFieldValid
            ? const Icon(Icons.check_circle, color: Palette.primaryColor)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color:
                isTextFieldValid ? Colors.green : Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
