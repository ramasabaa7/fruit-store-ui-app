import 'package:flutter/material.dart';

class RichTextDetails extends StatelessWidget {
  const RichTextDetails({
    super.key,
    required this.subTitle,
    required this.title,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
