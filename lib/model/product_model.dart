class ProductModel {
  final String name;
  final int quantity;
  final int price;
  final String id;

  ProductModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.id,
  });

  
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      id: json['id'],
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'id': id,
    };
  }
}
