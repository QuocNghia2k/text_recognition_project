class ProductModel {
  int? id;
  String? brand;
  String? name;
  double? price;
  double? discountPrice;
  int? discountPercent;
  List<String>? colors;
  List<ProductSize>? productSizes;
  String? description;
  List<String>? images;
  int? quantity;

  ProductModel({this.id,
    this.brand,
    this.name,
    this.price,
    this.discountPrice,
    this.discountPercent,
    this.colors,
    this.productSizes,
    this.description,
    this.images,
    this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    if (json['discountPrice'] != null) {
      discountPrice = json['discountPrice'].toDouble();
    }
    discountPercent = json['discountPercent'];
    if (json['colors'] is Iterable<dynamic> && json['colors'].isNotEmpty) {
      colors = <String>[];
      for (final element in json['colors']) {
        if (element != null) {
          colors!.add(element);
        }
      }
    }
    if (json['productSize'] != null &&
        json['productSize'] is Iterable<dynamic> &&
        json['productSize'].isNotEmpty) {
      productSizes = <ProductSize>[];
      json['productSize'].forEach((v) {
        productSizes!.add(ProductSize.fromJson(v));
      });
    }
    description = json['description'];
    if (json['images'] is Iterable<dynamic> && json['images'].isNotEmpty) {
      images = <String>[];
      for (final element in json['images']) {
        if (element != null) {
          images!.add(element);
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discountPrice'] = this.discountPrice;
    data['discountPercent'] = this.discountPercent;
    data['colors'] = this.colors;
    if (this.productSizes != null) {
      data['productSize'] = this.productSizes!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['images'] = this.images;
    return data;
  }
}

class ProductSize {
  String? name;
  List<int>? size;

  ProductSize({this.name, this.size});

  ProductSize.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'] is Iterable<dynamic> ? json['size'].cast<int>() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['size'] = this.size;
    return data;
  }
}