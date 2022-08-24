import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vgo_app/constants/palette.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {Key? key,
      required this.lable,
      this.isPasswordField = false,
      this.type = TextInputType.text,
      required this.controller,
      required this.onPressed,
      this.errorText})
      : super(key: key);

  final bool isPasswordField;
  final String lable;
  final TextInputType type;
  final TextEditingController controller;

  String? errorText;
  VoidCallback onPressed;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          style: TextStyle(
            color: widget.errorText == null
                ? Colors.grey
                : Colors.red.withOpacity(0.7),
          ),
          cursorColor: Palette.primaryColor,
          keyboardType: widget.type,
          obscureText: _isShow ? true : false,
          onTap: widget.onPressed,
          decoration: InputDecoration(
            hintText: widget.lable,
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5),
            ),
            errorText: widget.errorText ?? widget.errorText,
            fillColor: Palette.primaryColor,

            // isDense: true,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Palette.primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 0.5,
              ),
            ),

            suffixIcon: widget.isPasswordField
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/${!_isShow ? "open" : "close"}_eye_icon.svg",
                        height: 24,
                        width: 24,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isShow = !_isShow;
                        });
                      },
                    ),
                  )
                : null,

            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          autocorrect: false,
        ),
      ],
    );
  }
}
