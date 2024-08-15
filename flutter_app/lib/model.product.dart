class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'description': String description,
        'price': double price,
      } =>
        ProductModel(
          id: id,
          name: name,
          description: description,
          price: price,
        ),
      _ => throw const FormatException('Failed to load.'),
    };
  }
}
