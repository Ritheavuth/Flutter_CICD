import 'package:flutter/material.dart';
import 'package:vgo_app/Discount/widget.dart';

import 'package:vgo_app/Validator/check_email.dart';

@immutable
// ignore: must_be_immutable
class EmailInput extends StatefulWidget {
  TextEditingController? controller;
  Function(String?)? onSaved;
  FocusNode? currendNode;
  FocusNode? nextNode;

  EmailInput({
    Key? key,
    this.controller,
    this.onSaved,
    this.currendNode,
    this.nextNode,
  }) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  var isTextFieldValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableIMEPersonalizedLearning: false,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      onSaved: widget.onSaved,
      onFieldSubmitted: (_) {
        widget.nextNode!.requestFocus();
      },
      onChanged: (value) {
        if (Email.checkEmailFormat(value) == null) {
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
        return Email.checkEmailFormat(value!);
      },
      decoration: InputDecoration(
        hintText: 'vgoapp@example.com',
        labelText: 'EMAIL',
         hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
        labelStyle: const TextStyle(fontSize: 12),
        focusColor: Palette.primaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.primaryColor,
            width: 2,
          ),
        ),
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
