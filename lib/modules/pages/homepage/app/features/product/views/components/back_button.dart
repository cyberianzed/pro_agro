part of product_detail;

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({required this.onPressed, Key? key}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(
        FontAwesomeIcons.chevronLeft,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: onPressed,
      size: 40,
      borderRadius: 10,
      tooltip: "Back",
    );
  }
}
