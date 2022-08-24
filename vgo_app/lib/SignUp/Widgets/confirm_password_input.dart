// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';
import 'package:vgo_app/Validator/check_password_pattern.dart';

@immutable
class ConfirmPasswordInput extends StatefulWidget {
  TextEditingController passwordcontroller;
  Function(String?)? onSaved;

  FocusNode? currendNode;
  FocusNode? nextNode;

  ConfirmPasswordInput({
    Key? key,
    required this.passwordcontroller,
    this.onSaved,
    this.currendNode,
    this.nextNode,
  }) : super(key: key);

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  var isTextFieldValid = false;
  var hintText = 'Confirm Password';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onSaved: widget.onSaved,
      onFieldSubmitted: (_) {
        widget.nextNode!.requestFocus();
      },
      onChanged: (value) {
        setState(() {
          if (Password.checkConfirmPasword(
              value, widget.passwordcontroller.text)) {
            isTextFieldValid = true;
          } else {
            isTextFieldValid = false;
          }
        });
      },
      onTap: () {
        setState(() {
          hintText = '';
        });
      },
      validator: (value) {
        if (!Password.checkConfirmPasword(
            value, widget.passwordcontroller.text)) {
          return 'password and confirm password is not match!';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: 'Confirm Password*',
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
        labelStyle: const TextStyle(fontSize: 13),
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
                isTextFieldValid ? Colors.green : Colors.green.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
