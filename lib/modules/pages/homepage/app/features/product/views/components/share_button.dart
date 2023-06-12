part of product_detail;

class CartButton extends StatelessWidget {
  const CartButton({required this.onPressed, Key? key}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(FontAwesomeIcons.cartShopping,
          color: Theme.of(context).primaryColor),
      onPressed: onPressed,
      size: 40,
      borderRadius: 10,
      tooltip: "Add to Cart",
    );
  }
}
