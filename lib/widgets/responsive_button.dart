import 'package:flutter/material.dart';

class ResponsiveButton extends StatefulWidget {
  final bool? isResponsive;
  final double? width;
  final VoidCallback onPressed;

  const ResponsiveButton({
    this.width,
    this.isResponsive,
    required this.onPressed,
    super.key,
  });

  @override
  State<ResponsiveButton> createState() => _ResponsiveButtonState();
}

class _ResponsiveButtonState extends State<ResponsiveButton> {
  bool _isPressed = false; // Menyimpan status apakah tombol sedang ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true; // Menyala saat tombol ditekan
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false; // Kembali normal setelah ditekan
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false; // Kembali normal jika tekan dibatalkan
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: _isPressed ? 0.7 : 1.0, // Mengatur opacity saat ditekan
        child: Container(
          height: 70,
          width: widget.isResponsive == true
              ? MediaQuery.of(context).size.width * 0.9
              : widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue, // Warna latar tombol
          ),
          child: Center(
            child: Text(
              '  GET STARTED!!  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
