import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {required this.label, required this.onpressed, super.key});
  final String label;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextButton(
          onPressed: () {
            onpressed();
          },
          child: (label == 'C')
              ? Text(
                  label,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              : Text(label)),
    );
  }
}
