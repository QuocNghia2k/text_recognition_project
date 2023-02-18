import 'widget/expantion_option.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/debouncer.dart';
import '../../../widgets/unfocus_widget.dart';

import 'widget/text_field_search.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../blocs/search/search_bloc.dart';
import '../../../core/base/base.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import '../../../resources/resources.dart';

class SearchPage extends StatefulWidget {
  final SearchBloc bloc;
  SearchPage(this.bloc);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends BaseState<SearchPage, SearchBloc>
    with TickerProviderStateMixin {
  final _debouncer = Debouncer(milliseconds: 500);
  List listIcon = [
    Assets.images.svg.icHighHeel.svg(),
    Assets.images.svg.icHandbag.svg(),
    Assets.images.svg.icNecklace.svg(),
    Assets.images.svg.icTag.svg()
  ];

  @override
  void initState() {
    super.initState();
    widget.bloc.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusWidget(
      child: StreamBuilder<List<CategoryModel>?>(
        stream: bloc.listCategory,
        builder: (context, snp) {
          return !snp.hasData
              ? Center(
                  child: SpinKitFadingCircle(color: AppColors.primaryBlack),
                )
              : DefaultTabController(
                  length: snp.data?.length ?? 0,
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 140,
                      automaticallyImplyLeading: false,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              localization.search.toUpperCase(),
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          StreamBuilder<List<ProductModel>?>(
                            stream: bloc.listProductSearch,
                            builder: (context, snapshot) {
                              return TextFieldSeerch(
                                search: (value) {
                                  _debouncer.run(() {
                                    bloc.searchData(value);
                                  });
                                },
                                listSearch: snapshot.data,
                              );
                            },
                          )
                        ],
                      ),
                      shape:
                          Border(bottom: BorderSide(color: AppColors.platinum)),
                      bottom: TabBar(
                        indicatorColor: AppColors.primaryBlack,
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(right: 27),
                        indicatorPadding: EdgeInsets.only(right: 27),
                        labelColor: AppColors.onyx,
                        unselectedLabelStyle: theme.textTheme.labelLarge
                            ?.copyWith(color: AppColors.darkSilver),
                        labelStyle: theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                        tabs: List<Tab>.generate(
                            snp.data?.length ?? 0,
                            (index) => Tab(
                                  text: snp.data?[index].name,
                                )),
                      ),
                    ),
                    body: TabBarView(
                      children: List<Widget>.generate(
                        snp.data?.length ?? 0,
                        (index) => _expansion(snp.data![index]),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget _expansion(CategoryModel catrgory) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Divider(
            height: 1,
            color: AppColors.platinum,
          ),
        );
      },
      itemCount: catrgory.option?.length ?? 0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, indexOption) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ExpantionOption(
            icon: listIcon[indexOption],
            option: catrgory.option?[indexOption] ?? OptionModel(),
          ),
        );
      },
    );
  }

  @override
  SearchBloc get bloc => widget.bloc;
}
