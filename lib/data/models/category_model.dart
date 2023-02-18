import 'package:equatable/equatable.dart';

import 'option_model.dart';

class CategoryModel extends Equatable{
  String? name;
  String? urlImage;
  List<OptionModel>? option;

  CategoryModel({this.name, this.urlImage, this.option});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    urlImage = json['urlImage'];
    if (json['option'] != null && json['option'].isNotEmpty) {
      option = <OptionModel>[];
      json['option'].forEach((v) {
        option!.add(OptionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nanme'] = this.name;
    data['urlImage'] = this.urlImage;
    if (this.option != null) {
      data['option'] = this.option!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [name, urlImage, option];

  
}
