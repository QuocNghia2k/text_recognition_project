import 'package:flutter/material.dart';
import '../../../core/base/base.dart';
import '../../../blocs/blocs.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/inkwell_wrapper.dart';

class HistoryPage extends StatefulWidget {
  final HistoryBloc bloc;
  const HistoryPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseState<HistoryPage, HistoryBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => widget.bloc.loadData(),
        color: AppColors.primaryBlack,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWellWrapper(
                color: AppColors.primaryBlack,
                child: Text(
                  "Get data",
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  bloc.getData();
                },
                paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
              ),
              SizedBox(
                height: 20,
              ),
              InkWellWrapper(
                color: AppColors.primaryBlack,
                child: Text(
                  "set data",
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  bloc.setData({});
                },
                paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HistoryBloc get bloc => widget.bloc;
}
