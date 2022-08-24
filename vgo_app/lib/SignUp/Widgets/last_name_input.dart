import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

import 'package:vgo_app/Validator/check_naming_convention.dart';

@immutable
// ignore: must_be_immutable
class LastNameInput extends StatefulWidget {
  TextEditingController? controller;
  Function(String?)? onSaved;

  FocusNode? currendNode;
  FocusNode? nextNode;

  LastNameInput({
    Key? key,
    this.controller,
    this.onSaved,
    this.currendNode,
    this.nextNode,
  }) : super(key: key);

  @override
  State<LastNameInput> createState() => _LastNameInputState();
}

class _LastNameInputState extends State<LastNameInput> {
  var isTextFieldValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableIMEPersonalizedLearning: false,
      focusNode: widget.currendNode,
      keyboardType: TextInputType.name,
      onSaved: widget.onSaved,
      controller: widget.controller,
      onFieldSubmitted: (_) {
        widget.nextNode!.requestFocus();
      },
      onChanged: (value) {
        if (NamingConvetion.nameValidation(value) == null) {
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
        return NamingConvetion.nameValidation(value!);
      },
      decoration: InputDecoration(
        hintText: 'activity',
        labelText: "LAST NAME",
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
        labelStyle: const TextStyle(fontSize: 12),
        focusColor:
            isTextFieldValid ? Palette.primaryColor : Palette.invalidColor,
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
