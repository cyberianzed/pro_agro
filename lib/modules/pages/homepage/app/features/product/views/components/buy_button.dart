part of product_detail;

class _AddCartButton extends StatelessWidget {
  const _AddCartButton({required this.onPressed, Key? key}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text("Add to Cart"),
      ),
    );
  }
}
