class Product {
  final String name;
  final String brand;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.brand,
      required this.price,
      required this.imageUrl
      });
      
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          brand == other.brand;

  @override
  int get hashCode => name.hashCode ^ brand.hashCode;
}
