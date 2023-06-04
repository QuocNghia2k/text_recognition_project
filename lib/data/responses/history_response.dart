import '../data.dart';

class HistoryResponse {
  List<HistoryModel>? historyModels;

  HistoryResponse({this.historyModels});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['historyModel'] != null) {
      historyModels = <HistoryModel>[];
      json['historyModel'].forEach((v) {
        historyModels!.add(new HistoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.historyModels != null) {
      data['historyModel'] = this.historyModels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
