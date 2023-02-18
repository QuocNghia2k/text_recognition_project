import '../data.dart';

class OrderDetailsModel {
  int? id;
  int? quantity;
  double? price;
  OrderSizeModel? orderSize;
  ProductModel? product;

  OrderDetailsModel({this.id, this.quantity, this.product, this.price});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    orderSize = json['orderSize'] != null
        ? OrderSizeModel.fromJson(json['orderSize'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.orderSize != null) {
      data['orderSize'] = this.orderSize!.toJson();
    }
    return data;
  }
}

class OrderSizeModel {
  String? name;
  int? size;

  OrderSizeModel({this.name, this.size});

  OrderSizeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['size'] = this.size;
    return data;
  }
}