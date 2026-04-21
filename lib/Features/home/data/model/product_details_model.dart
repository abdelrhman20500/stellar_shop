
class ProductDetails {
  String? id;
  String? productCode;
  String? name;
  String? description;
  String? nameArabic;
  String? descriptionArabic;
  String? coverPictureUrl;
  List<dynamic>? productPictures;
  List<String>? categories;
  double? price;
  int? stock;
  double? weight;
  String? color;
  int? discountPercentage;
  int? rating;
  int? reviewsCount;
  String? sellerId;

  ProductDetails({this.id, this.productCode, this.name, this.description, this.nameArabic, this.descriptionArabic, this.coverPictureUrl, this.productPictures, this.categories, this.price, this.stock, this.weight, this.color, this.discountPercentage, this.rating, this.reviewsCount, this.sellerId});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["productCode"] is String) {
      productCode = json["productCode"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["nameArabic"] is String) {
      nameArabic = json["nameArabic"];
    }
    if(json["descriptionArabic"] is String) {
      descriptionArabic = json["descriptionArabic"];
    }
    if(json["coverPictureUrl"] is String) {
      coverPictureUrl = json["coverPictureUrl"];
    }
    if(json["productPictures"] is List) {
      productPictures = json["productPictures"] ?? [];
    }
    if(json["categories"] is List) {
      categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toDouble();
    }
    if(json["stock"] is num) {
      stock = (json["stock"] as num).toInt();
    }
    if(json["weight"] is num) {
      weight = (json["weight"] as num).toDouble();
    }
    if(json["color"] is String) {
      color = json["color"];
    }
    if(json["discountPercentage"] is num) {
      discountPercentage = (json["discountPercentage"] as num).toInt();
    }
    if(json["rating"] is num) {
      rating = (json["rating"] as num).toInt();
    }
    if(json["reviewsCount"] is num) {
      reviewsCount = (json["reviewsCount"] as num).toInt();
    }
    if(json["sellerId"] is String) {
      sellerId = json["sellerId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["productCode"] = productCode;
    data["name"] = name;
    data["description"] = description;
    data["nameArabic"] = nameArabic;
    data["descriptionArabic"] = descriptionArabic;
    data["coverPictureUrl"] = coverPictureUrl;
    if(productPictures != null) {
      data["productPictures"] = productPictures;
    }
    if(categories != null) {
      data["categories"] = categories;
    }
    data["price"] = price;
    data["stock"] = stock;
    data["weight"] = weight;
    data["color"] = color;
    data["discountPercentage"] = discountPercentage;
    data["rating"] = rating;
    data["reviewsCount"] = reviewsCount;
    data["sellerId"] = sellerId;
    return data;
  }
}