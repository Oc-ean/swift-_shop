import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final dynamic text;
  final VoidCallback? onTap;
  const AuthButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.indigoAccent),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
