import 'package:flutter/material.dart';
import 'package:funny_app/core/utils/text_style.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor = const Color.fromARGB(255, 255, 138, 138),
    this.forGround = const Color(0xffffffff),
  });
  final String text;
  final Function() onPressed;
  final Color backGroundColor;
  final Color forGround;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backGroundColor,
              foregroundColor: forGround,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: onPressed,
          child: Text(
            text,
            style: getTitleStyle(color: Colors.white),
          )),
    );
  }
}
