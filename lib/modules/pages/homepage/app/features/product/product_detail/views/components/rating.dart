part of product_detail;

class _Rating extends StatelessWidget {
  const _Rating(this.data, {Key? key}) : super(key: key);

  final double data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: data,
          itemBuilder: (context, index) => const Icon(
            FontAwesomeIcons.solidStar,
            color: Colors.amber,
          ),
          itemPadding: const EdgeInsets.all(3),
          unratedColor: Colors.grey,
          itemCount: 5,
          itemSize: 15,
          direction: Axis.horizontal,
        ),
        const SizedBox(width: 5),
        Text(
          "($data)",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
