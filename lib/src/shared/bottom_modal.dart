import 'package:flutter/material.dart';

class AppBottomModal {
  static void showBottomModal(BuildContext context, Widget child) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        backgroundColor: Colors.white,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                          color: Color.fromRGBO(67, 67, 67, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 21),
                    child,
                  ],
                ),
              ),
            ));
  }
}
