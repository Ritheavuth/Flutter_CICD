import 'package:flutter/material.dart';

import 'package:vgo_app/Login/widget.dart';

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const ProfileButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1 / 2),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Container(
          width: size.width,
          height: size.height * 0.07,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: size.width * 0.1 / 2,
                    color: Palette.primaryColor,
                  ),
                  const SizedBox(width: 10),
                  FittedBox(
                    child: TextWidget(
                      text: title,
                      size: size.width * 0.1 / 2 - 4,
                      color: Palette.primaryColor,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward,
                color: Palette.primaryColor,
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.withOpacity(0.1),
          onPrimary: Palette.primaryColor,
          shadowColor: Colors.white,
          elevation: 0,
          side: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
