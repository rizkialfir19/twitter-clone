import 'package:flutter/material.dart';
import 'package:twitter_clone/ui/ui.dart';

class ContainerSocialMediaButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool useIcon;
  final IconData? icon;
  final Color? color;

  const ContainerSocialMediaButton({
    Key? key,
    required this.title,
    this.titleColor,
    this.useIcon = true,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50.0,
        ),
        color: color ?? Palette.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          useIcon
              ? Icon(
                  icon ?? Icons.mail_outline,
                  color: Palette.black,
                )
              : const SizedBox(),
          useIcon
              ? const SizedBox(
                  width: 15.0,
                )
              : const SizedBox(),
          Text(
            title,
            style: FontHelper.h6Bold(
              color: titleColor ?? Palette.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
