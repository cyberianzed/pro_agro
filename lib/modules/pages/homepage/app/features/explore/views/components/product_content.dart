part of explore;

class _ProductContent extends StatelessWidget {
  const _ProductContent({
    required this.onPressed,
    Key? key,
    required this.searchQuery,
    required this.fetchData,
    required this.onSearch,
  }) : super(key: key);

  final Function(Product product) onPressed;
  final Future<List<Product>> Function(String) fetchData;
  final String searchQuery;
  final void Function(List<Product>, String) onSearch;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: UniqueKey(), // Assign a unique key to the KeyedSubtree
      child: FutureBuilder(
        future: fetchData(searchQuery),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          } else {
            final List<Product> data = snapshot.data!;

            onSearch(snapshot.data!, searchQuery); // Trigger onSearch callback
            return StaggeredGridView.countBuilder(
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
            );
          }
        },
      ),
    );
  }
}
