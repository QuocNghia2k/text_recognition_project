import 'package:text_recognition_project/widgets/inkWell_wrapper.dart';

import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../data/data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../resources/resources.dart';
import '../../../router/router.dart';
import 'widgets/category_block.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;

  HomePage(this.bloc);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void initData() {
    widget.bloc.loadData();
    super.initData();
  }

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
                  localization.convert_text,
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.textConvert);
                },
                paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
              ),
              SizedBox(
                height: 20,
              ),
              InkWellWrapper(
                color: AppColors.primaryBlack,
                child: Text(
                  "Image convert text",
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.textConvertImage);
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
  HomeBloc get bloc => widget.bloc;
}
