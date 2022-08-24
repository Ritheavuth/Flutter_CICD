import 'package:flutter/material.dart';
import 'package:vgo_app/ActivityDetail/widget.dart';
import 'package:vgo_app/Validator/check_password_pattern.dart';

@immutable
// ignore: must_be_immutable
class LogInPasswordInput extends StatefulWidget {
  TextEditingController? controller;
  Function(String?)? onSaved;

  FocusNode? currendNode;
  FocusNode? nextNode;

  LogInPasswordInput({
    Key? key,
    this.controller,
    this.currendNode,
    this.nextNode,
    this.onSaved,
  }) : super(key: key);

  @override
  State<LogInPasswordInput> createState() => _LogInPasswordInputState();
}

class _LogInPasswordInputState extends State<LogInPasswordInput> {
  var isTextFieldValid = false;
  var isObscureText = true;
  var hintText = 'Password';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableIMEPersonalizedLearning: false,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      onSaved: widget.onSaved,
      obscureText: isObscureText,
      onChanged: _checkPasswordValid,
      onTap: () {
        setState(() {
          hintText = '';
        });
      },
      validator: (value) {
        return Password.checkPasswordPattern(value!);
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: 'Password*',
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
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText ? Icons.visibility : Icons.visibility_off,
                    color: Palette.primaryColor,
                    size: 16,
                  ),
                ),
              ),
              (isTextFieldValid
                  ? const Icon(
                      Icons.check_circle,
                      color: Palette.primaryColor,
                      size: 20,
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

  // password
  _checkPasswordValid(String value) {
    if (Password.checkPasswordPattern(value) == null) {
      setState(() {
        isTextFieldValid = true;
      });
    } else {
      setState(() {
        isTextFieldValid = false;
      });
    }
  }
}
