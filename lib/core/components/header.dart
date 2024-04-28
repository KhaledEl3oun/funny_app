// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:funny_app/core/utils/text_style.dart';
import 'package:gap/gap.dart';

class header extends StatelessWidget {
  const header({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to Funny App',
          style: getTitleStyle(
            fontSize: 37,
          ),
        ),
        const Gap(50),
        Text(
          text,
          style: getTitleStyle(fontSize: 24),
        ),
      ],
    );
  }
}
