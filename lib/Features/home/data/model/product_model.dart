
class ProductModel {
  List<Items>? items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ProductModel({this.items, this.page, this.pageSize, this.totalCount, this.hasNextPage, this.hasPreviousPage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if(json["page"] is num) {
      page = (json["page"] as num).toInt();
    }
    if(json["pageSize"] is num) {
      pageSize = (json["pageSize"] as num).toInt();
    }
    if(json["totalCount"] is num) {
      totalCount = (json["totalCount"] as num).toInt();
    }
    if(json["hasNextPage"] is bool) {
      hasNextPage = json["hasNextPage"];
    }
    if(json["hasPreviousPage"] is bool) {
      hasPreviousPage = json["hasPreviousPage"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["page"] = page;
    _data["pageSize"] = pageSize;
    _data["totalCount"] = totalCount;
    _data["hasNextPage"] = hasNextPage;
    _data["hasPreviousPage"] = hasPreviousPage;
    return _data;
  }
}

class Items {
  String? id;
  String? productCode;
  String? name;
  String? description;
  String? arabicName;
  String? arabicDescription;
  String? coverPictureUrl;
  dynamic productPictures;
  double? price;
  int? stock;
  double? weight;
  String? color;
  int? rating;
  int? reviewsCount;
  int? discountPercentage;
  String? sellerId;
  List<String>? categories;

  Items({this.id, this.productCode, this.name, this.description, this.arabicName, this.arabicDescription, this.coverPictureUrl, this.productPictures, this.price, this.stock, this.weight, this.color, this.rating, this.reviewsCount, this.discountPercentage, this.sellerId, this.categories});

  Items.fromJson(Map<String, dynamic> json) {
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
    if(json["arabicName"] is String) {
      arabicName = json["arabicName"];
    }
    if(json["arabicDescription"] is String) {
      arabicDescription = json["arabicDescription"];
    }
    if(json["coverPictureUrl"] is String) {
      coverPictureUrl = json["coverPictureUrl"];
    }
    productPictures = json["productPictures"];
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
    if(json["rating"] is num) {
      rating = (json["rating"] as num).toInt();
    }
    if(json["reviewsCount"] is num) {
      reviewsCount = (json["reviewsCount"] as num).toInt();
    }
    if(json["discountPercentage"] is num) {
      discountPercentage = (json["discountPercentage"] as num).toInt();
    }
    if(json["sellerId"] is String) {
      sellerId = json["sellerId"];
    }
    if(json["categories"] is List) {
      categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["productCode"] = productCode;
    _data["name"] = name;
    _data["description"] = description;
    _data["arabicName"] = arabicName;
    _data["arabicDescription"] = arabicDescription;
    _data["coverPictureUrl"] = coverPictureUrl;
    _data["productPictures"] = productPictures;
    _data["price"] = price;
    _data["stock"] = stock;
    _data["weight"] = weight;
    _data["color"] = color;
    _data["rating"] = rating;
    _data["reviewsCount"] = reviewsCount;
    _data["discountPercentage"] = discountPercentage;
    _data["sellerId"] = sellerId;
    if(categories != null) {
      _data["categories"] = categories;
    }
    return _data;
  }
}