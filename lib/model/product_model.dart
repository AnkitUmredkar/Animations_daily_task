class ProductModel {
  late String image, name, price;

  ProductModel({required this.image, required this.name, required this.price});

  factory ProductModel.fromMap(Map m1) {
    return ProductModel(
        image: m1["image"], name: m1["name"], price: m1["price"]);
  }
}
