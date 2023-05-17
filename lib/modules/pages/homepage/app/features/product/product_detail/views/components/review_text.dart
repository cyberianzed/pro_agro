part of product_detail;

class _ReviewsText extends StatelessWidget {
  const _ReviewsText(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.right,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
    );
  }
}
