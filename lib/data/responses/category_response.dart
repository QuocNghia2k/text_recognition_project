import '../models/category_model.dart';

class CategoryResponse {
  List<CategoryModel>? category;

  CategoryResponse({this.category});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null && json['category'].isNotEmpty) {
      category = <CategoryModel>[];
      json['category'].forEach((v) {
        category!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
