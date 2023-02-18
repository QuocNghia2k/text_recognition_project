import '../data.dart';

class ProductResponse {
  List<ProductModel>? listProduct;
  ProductResponse({this.listProduct});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null && json['products'].isNotEmpty) {
      listProduct = <ProductModel>[];
      json['products'].forEach((v) {
        listProduct!.add(ProductModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.listProduct != null) {
      data['products'] = this.listProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
