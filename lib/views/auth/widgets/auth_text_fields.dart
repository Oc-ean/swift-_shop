import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final dynamic validator;
  final bool? obscure;
  final Widget? iconButton;
  final VoidCallback onTap;
  final dynamic controller;
  const ReusableTextField(
      {Key? key,
      required this.hintText,
      this.controller,
      required this.onTap,
      this.validator,
      this.obscure,
      this.iconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final keyBoardProvider = Provider.of<KeyboardProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      height: 50,
      child: TextFormField(
        onTap: onTap,
        validator: validator,
        obscureText: obscure!,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: iconButton!,
          labelStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
          contentPadding: const EdgeInsets.only(top: 5, left: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1.5, color: Colors.grey),
          ),
          fillColor: Colors.white,
          filled: true,
        ),

        // onChanged: (text) {
        //   keyBoardProvider.setKeyboardOpen(text.isNotEmpty);
        // },
      ),
    );
  }
}
