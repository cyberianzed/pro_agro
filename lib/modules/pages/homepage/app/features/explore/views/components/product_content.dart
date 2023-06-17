part of explore;

class _ProductContent extends StatelessWidget {
  const _ProductContent(this.dataFuture, {required this.onPressed, Key? key})
      : super(key: key);

  final Future<List<Product>> dataFuture;
  final Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Product> data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing),
            child: StaggeredGridView.countBuilder(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => ProductCard(
                heroTag: data[index].id,
                data: ProductCardData(
                  imageurl: data[index].images[0],
                  initialFavorite: data[index].isFavorite,
                  name: data[index].name,
                  price: data[index].price,
                ),
                onTap: () {
                  onPressed(data[index]);
                },
              ),
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error fetching data');
        }
        // Display a loading spinner while waiting for the data
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
