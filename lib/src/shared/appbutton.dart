import 'package:chit_vendor/src/app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool active;
  final bool loading;
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.active = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: active ? onTap : null,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 53,
          decoration: BoxDecoration(
            color:
                active ? primaryColor : const Color.fromRGBO(234, 249, 245, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
          )),
    );
  }
}
