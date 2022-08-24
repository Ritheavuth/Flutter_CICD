import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

import 'package:vgo_app/Validator/check_naming_convention.dart';

@immutable
// ignore: must_be_immutable
class FirstNameInput extends StatefulWidget {
  TextEditingController? controller;
  Function(String?)? onSaved;
  FocusNode? currendNode;
  FocusNode? nextNode;

  FirstNameInput({
    Key? key,
    this.controller,
    this.onSaved,
    this.currendNode,
    this.nextNode,
  }) : super(key: key);

  @override
  State<FirstNameInput> createState() => _FirstNameInputState();
}

class _FirstNameInputState extends State<FirstNameInput> {
  var isCorrectForm = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableIMEPersonalizedLearning: false,
      keyboardType: TextInputType.name,
      controller: widget.controller,
      onSaved: widget.onSaved,
      onFieldSubmitted: (_) {
        widget.nextNode!.requestFocus();
      },
      onChanged: (value) {
        if (NamingConvetion.nameValidation(value) == null) {
          setState(() {
            isCorrectForm = true;
          });
        } else {
          setState(() {
            isCorrectForm = false;
          });
        }
      },
      validator: (value) {
        return NamingConvetion.nameValidation(value!);
      },
      decoration: InputDecoration(
        hintText: 'first name',
        labelText: 'FIRST NAME*',
        labelStyle: const TextStyle(fontSize: 12),
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
        focusColor: Palette.primaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.primaryColor,
            width: 2,
          ),
        ),
        errorMaxLines: 2,
        errorStyle: const TextStyle(overflow: TextOverflow.fade),
        suffixIcon: isCorrectForm
            ? const Icon(Icons.check_circle, color: Palette.primaryColor)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: isCorrectForm ? Colors.green : Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
