import 'package:flutter/material.dart';
import '../../../core/base/base.dart';
import '../../../blocs/blocs.dart';

class HistoryPage extends StatefulWidget {
  final HistoryBloc bloc;
  const HistoryPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseState<HistoryPage, HistoryBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  HistoryBloc get bloc => widget.bloc;
}
