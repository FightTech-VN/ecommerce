class Product {
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final String image;
  final int stock;
  final int id;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.stock,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'price': price});
    result.addAll({'description': description});
    result.addAll({'images': images});
    result.addAll({'image': image});
    result.addAll({'stock': stock});
    result.addAll({'id': id});

    return result;
  }

  factory Product.formJson(Map<String, dynamic> map) {
    return Product(
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      image: map['image'] ?? '',
      stock: map['stock']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }
}
