import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool outline;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: icon != null
            ? Icon(icon, size: 20, color: outline ? const Color(0xFF2563EB) : Colors.white)
            : const SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: outline ? const Color(0xFF2563EB) : Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: outline ? Colors.transparent : const Color(0xFF2563EB),
          elevation: 0,
          side: outline ? const BorderSide(color: Color(0xFF2563EB)) : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
      ),
    );
  }
}
