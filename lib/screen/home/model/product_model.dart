class ProductModel {
  int? id;
  num? price;
  String? title, dec, cat, image;
  RatingModel? rating;

  ProductModel(
      {this.id,
      this.price,
      this.title,
      this.dec,
      this.cat,
      this.image,
      this.rating});

  factory ProductModel.mapToModel(Map m1) {
    return ProductModel(
      id: m1['id'],
      price: m1['price'],
      title: m1['title'],
      dec: m1['description'],
      cat: m1['category'],
      image: m1['image'],
      rating: RatingModel.mapToModel(m1['rating']),
    );
  }
}

class RatingModel {
  num? rate;
  int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.mapToModel(Map m1) {
    return RatingModel(
      count: m1['count'],
      rate: m1['rate'],
    );
  }
}
