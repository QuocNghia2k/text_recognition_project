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
          child: InkWellWrapper(
            color: AppColors.primaryBlack,
            child: Text(
              localization.convert_text,
              style: theme.textTheme.titleSmall?.copyWith(
                  color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Navigator.pushNamed(context, Routes.textConvert);
            },
            paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _homeDefault() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      physics: AlwaysScrollableScrollPhysics(),
      child: StreamBuilder<List<CategoryModel>?>(
        stream: widget.bloc.listCategory,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SpinKitFadingCircle(color: AppColors.primaryBlack),
            );
          } else {
            return Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: CategoryBlock(
                      imgBackground: '${snapshot.data![0].urlImage}',
                      child: Text(snapshot.data?[0].name ?? "",
                          style: theme.textTheme.titleSmall?.copyWith(
                              color: AppColors.darkCharcoal,
                              fontWeight: FontWeight.w500)),
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.allProduct),
                    )),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                        child: CategoryBlock(
                      imgBackground: '${snapshot.data![1].urlImage}',
                      child: Text(snapshot.data?[1].name ?? "",
                          style: theme.textTheme.titleSmall),
                      onTap: () {},
                    ))
                  ],
                ),
                ...List.generate(
                    snapshot.data!.length - 2,
                    (index) => CategoryBlock(
                          imgBackground:
                              '${snapshot.data![index + 2].urlImage}',
                          child: Text(
                            snapshot.data?[index + 2].name ?? "",
                            style: theme.textTheme.headlineLarge,
                          ),
                          isButton: false,
                          onTap: () {},
                        )),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
