import 'package:flutter/material.dart';
import 'package:vgo_app/constants/palette.dart';
import 'package:vgo_app/utility/text_widget.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    Key? key,
    this.isFillBackground = true,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final bool isFillBackground;
  final String title;
  final VoidCallback onPressed;

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: TextWidget(
          text: widget.title,
          size: 24,
          color: widget.isFillBackground ? Colors.white : Colors.black,
        ),
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          color: widget.isFillBackground ? Palette.primaryColor : null,
          borderRadius: BorderRadius.circular(4),
          border: widget.isFillBackground
              ? null
              : Border.all(
                  width: 1,
                  color: Palette.primaryColor,
                ),
        ),
      ),
    );
  }
}
