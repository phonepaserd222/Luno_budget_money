import 'package:flutter/material.dart';

class TextEdit extends StatelessWidget {
  final String text;
  final double fonts;
  final double padtop;
  final Color colort;
  final FontWeight? fontwb;
  const TextEdit({
    super.key,
    required this.text,
    required this.fonts,
    required this.padtop,
    required this.colort,
    this.fontwb,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padtop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style:
                TextStyle(fontSize: fonts, color: colort, fontWeight: fontwb),
          )
        ],
      ),
    );
  }
}
// 'ຈຳນວນເງິນທັງໝົດທີ່ຕ້ອງຊ່ຳລະ'