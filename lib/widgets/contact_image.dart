import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final double width;
  const ContactImage({
    this.width = 200.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "contact",
      child: Container(
        width: width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 0),
              spreadRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(600),
          child: Image.asset(
            "images/stacy.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
