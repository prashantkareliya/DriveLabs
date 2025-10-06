import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Color? borderColor;
  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 1.5)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingIcon != null) ...[
              trailingIcon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(width: 8),
            if (leadingIcon != null) ...[
              leadingIcon!,
              const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }
}
