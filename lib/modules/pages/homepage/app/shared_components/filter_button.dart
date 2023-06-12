import 'package:flutter/material.dart';
import 'custom_icon_button.dart';

class FilterSizeButton extends StatelessWidget {
  const FilterSizeButton(
      {required this.onPressed, this.size = 60, Key? key, required this.icon})
      : super(key: key);

  final Function() onPressed;
  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: onPressed,
      size: size,
    );
  }
}
