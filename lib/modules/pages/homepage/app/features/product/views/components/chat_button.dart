part of product_detail;

class _ViewCartButton extends StatelessWidget {
  const _ViewCartButton({required this.onPressed, Key? key}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(
        FontAwesomeIcons.cartShopping,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: onPressed,
      size: 40,
      borderRadius: 10,
      color: Theme.of(context).primaryColor.withOpacity(.2),
      tooltip: "chat",
    );
  }
}
