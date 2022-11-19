import 'package:flutter/material.dart';

class CustomeTextFieldWidget extends StatelessWidget {
  final TextInputType? keyboard;
  final String? hintText;
  final Widget? prefixIcon;
  final String? initialValue;
  final Function(String)? onChange;

  const CustomeTextFieldWidget(
      {super.key,
      this.keyboard,
      this.hintText,
      this.prefixIcon,
      this.initialValue,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChange,
        keyboardType: keyboard,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10)),
      ),
    );
  }
}
