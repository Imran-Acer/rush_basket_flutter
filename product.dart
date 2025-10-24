class Product {
  double? price;
  String? image;
  double? rating;

  Product({this.price, this.image, this.rating});

  factory Product.fromJson(Map<String,dynamic> map){
    return Product(price:map['price'],image:map['image'],rating:map['rating']['rate']);
  }
}
