import 'dart:async';

import '../../core/core.dart';
import '../blocs.dart';

class HistoryBloc extends BaseBloc<HistoryState> {
  HistoryBloc();

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();
  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<void> loadData() async {}

  @override
  void dispose() {
    super.dispose();
  }
}
