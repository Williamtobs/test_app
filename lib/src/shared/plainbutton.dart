import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlainAppButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const PlainAppButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromRGBO(6, 78, 59, 1),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(6, 78, 59, 1),
            ),
          ),
        ),
      ),
    );
  }
}
