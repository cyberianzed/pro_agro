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

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({required this.onPressed, Key? key})
      : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(
        FontAwesomeIcons.trash,
        color: Colors.red,
      ),
      onPressed: onPressed,
      size: 40,
      borderRadius: 10,
      tooltip: "Back",
    );
  }
}
