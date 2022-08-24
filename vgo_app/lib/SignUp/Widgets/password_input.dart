import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';

import 'package:vgo_app/Validator/check_password_pattern.dart';

@immutable
// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  TextEditingController? controller;
  Function(String?)? onSaved;

  FocusNode? currendNode;
  FocusNode? nextNode;

  PasswordInput({
    Key? key,
    this.controller,
    this.onSaved,
    this.currendNode,
    this.nextNode,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  var isTextFieldValid = false;
  var isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableIMEPersonalizedLearning: false,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      obscureText: isObscureText,
      onSaved: widget.onSaved,
      onFieldSubmitted: (_) {
        widget.nextNode!.requestFocus();
      },
      onChanged: (value) {
        if (Password.checkPasswordPattern(value) == null) {
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
        return Password.checkPasswordPattern(value!);
      },
      decoration: InputDecoration(
        hintText: 'maximum 8 characters',
        labelText: 'Password*',
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
        labelStyle: const TextStyle(fontSize: 14),
        focusColor: Palette.primaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.primaryColor,
            width: 2,
          ),
        ),
        suffix: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: isTextFieldValid ? 60 : 40,
          curve: Curves.easeInCubic,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText ? Icons.visibility : Icons.visibility_off,
                    color: Palette.primaryColor,
                    size: 22,
                  ),
                ),
              ),
              (isTextFieldValid
                  ? const Icon(
                      Icons.check_circle,
                      color: Palette.primaryColor,
                      size: 22,
                    )
                  : Container()),
            ],
          ),
        ),
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
