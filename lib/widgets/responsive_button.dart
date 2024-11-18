import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final VoidCallback onPressed; // Tambahkan onPressed sebagai parameter

  const ResponsiveButton({
    this.width,
    this.isResponsive,
    required this.onPressed, // Pastikan onPressed bersifat required
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Atur onTap agar merespons sentuhan
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black45,
        ),
        child: Row(
          children: [
            Image.asset("img/panah.png"),
          ],
        ),
      ),
    );
  }
}
