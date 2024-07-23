import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String backgroundImageAsset, trailingIconAsset, leadingText;
  final VoidCallback onTap;
  const LanguageButton(
      {super.key,
      required this.backgroundImageAsset,
      required this.trailingIconAsset,
      required this.leadingText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(backgroundImageAsset),
          ),
        ),
        child: Row(
          children: [
            Image.asset(trailingIconAsset),
            const Spacer(),
            Text(
              leadingText,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
