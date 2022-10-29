import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {

  final String textTitle;
  final String data;

  const TextCustom({super.key, required this.textTitle, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),

      child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                  textTitle,
                  style: const TextStyle(
                    fontSize: 12,

                  )
              ),
            ),

            const VerticalDivider(width: 30),
            Text(": $data",
                style: const TextStyle(
                  fontSize: 12,
                ))
          ]
      ),
    );
  }
}
