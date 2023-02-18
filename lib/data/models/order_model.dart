import '../data.dart';

class OrderModel {
  int? id;
  double? subTotal;
  double? total;
  double? discount;
  double? feeShip;
  String? status;
  String? createAt;
  String? description;
  List<OrderDetailsModel>? orderDetails;
  UserModel? user;
  String? tokenDiscount;

  OrderModel(
      {this.id,
      this.subTotal,
      this.total,
      this.discount,
      this.feeShip,
      this.status,
      this.createAt,
      this.description,
      this.orderDetails,
      this.user,
      this.tokenDiscount});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subTotal = json['subTotal'];
    total = json['total'];
    discount = json['discount'];
    status = json['status'];
    createAt = json['createAt'];
    feeShip = json['feeShip'];
    description = json['description'];
    if (json['orderDetails'] is Iterable<dynamic> &&
        json['orderDetails'].isNotEmpty) {
      orderDetails = <OrderDetailsModel>[];
      json['orderDetails'].forEach((v) {
        if (v != null) {
          orderDetails!.add(OrderDetailsModel.fromJson(v));
        }
      });
    }
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    tokenDiscount = json['tokenDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['subTotal'] = this.subTotal;
    data['total'] = this.total;
    data['discount'] = this.discount;
    data['status'] = this.status;
    data['createAt'] = this.createAt;
    data['description'] = this.description;
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['tokenDiscount'] = this.tokenDiscount;
    return data;
  }
}