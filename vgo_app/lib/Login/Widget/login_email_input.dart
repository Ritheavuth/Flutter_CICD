import 'package:flutter/material.dart';
import 'package:vgo_app/Discount/widget.dart';
import 'package:vgo_app/Validator/check_email.dart';

@immutable
// ignore: must_be_immutable
class LogInEmailInput extends StatefulWidget {
  TextEditingController? controller;
  Function(String?)? onSaved;
  FocusNode? currendNode;
  FocusNode? nextNode;

  LogInEmailInput({
    Key? key,
    this.controller,
    this.currendNode,
    this.nextNode,
    this.onSaved,
  }) : super(key: key);

  @override
  State<LogInEmailInput> createState() => _LogInEmailInputState();
}

class _LogInEmailInputState extends State<LogInEmailInput> {
  var isTextFieldValid = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableIMEPersonalizedLearning: false,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      onSaved: widget.onSaved,
      autocorrect: false,
      enableInteractiveSelection: false,
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

  // email checking

}
