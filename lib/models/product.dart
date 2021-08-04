class Product {

  String id;
  String code;
  String name;
  String description;
  String image;
  int price;
  String category;
  int quantity;
  String inventoryStatus;
  int rating;

  Product({this.id = "",
      this.code = "",
      this.name = "",
      this.description = "",
      this.image = "",
      this.price = 0,
      this.category = "",
      this.quantity = 0,
      this.inventoryStatus = "",
      this.rating = 0});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      quantity: json['quantity'],
      inventoryStatus: json['inventoryStatus'],
      rating: json['rating']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category'] = this.category;
    data['quantity'] = this.quantity;
    data['inventoryStatus'] = this.inventoryStatus;
    data['rating'] = this.rating;
    return data;
  }

}