import 'package:equatable/equatable.dart';

class OptionModel extends Equatable {
  String? name;
  List<String>? topic;

  OptionModel({this.name, this.topic});

  OptionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['topic'] is Iterable<dynamic> && json['topic'].isNotEmpty) {
      topic = <String>[];
      for (final element in json['topic']) {
        if (element != null) {
          topic!.add(element);
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['topic'] = this.topic;
    return data;
  }

  @override
  List<Object?> get props => [name, topic];
}
