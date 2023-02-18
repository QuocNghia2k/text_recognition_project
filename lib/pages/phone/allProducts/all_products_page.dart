import '../../../data/data.dart';
import 'widgets/filter_dialog.dart';
import 'widgets/screen_product.dart';

import '../../../gen/assets.gen.dart';
import '../../../widgets/inkWell_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../core/core.dart';
import '../../../resources/colors.dart';

class AllProductsPage extends StatefulWidget {
  final AllProductsBloc bloc;
  AllProductsPage(this.bloc);

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState
    extends BaseState<AllProductsPage, AllProductsBloc> {
  bool islistGrid = true;
  @override
  void initState() {
    super.initState();
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Assets.images.png.logo.image(height: 19, width: 104),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: Assets.images.svg.icShoppingCart
                  .svg(color: AppColors.primaryBlack, width: 22, height: 22))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 16, left: 20),
              child: Text(
                localization.all_products,
                style: theme.textTheme.bodySmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWellWrapper(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return FilterDialog();
                      },
                      transitionBuilder: (_, animation1, __, child) {
                        return SlideTransition(
                          position: Tween(
                            begin: const Offset(0, -1),
                            end: const Offset(0, 0),
                          ).animate(animation1),
                          child: child,
                        );
                      },
                    );
                  },
                  margin: EdgeInsets.only(left: 20),
                  border: Border.all(color: AppColors.primaryGrey, width: 1),
                  paddingChild:
                      EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 12),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Assets.images.svg.icFilter.svg()),
                      Text(
                        localization.filter,
                        style: theme.textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 13),
                      onPressed: () {
                        setState(() {
                          islistGrid = false;
                        });
                      },
                      icon: Assets.images.svg.icList.svg(
                          color: islistGrid ? null : AppColors.primaryBlack),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(right: 13),
                      onPressed: () {
                        setState(() {
                          islistGrid = true;
                        });
                      },
                      icon: Assets.images.svg.icFeatherGrid.svg(
                          color: islistGrid ? null : AppColors.quickSilver),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(right: 20, left: 13),
                    //   child: Assets.images.svg.icFeatherGrid.svg(),
                    // )
                  ],
                ),
              ],
            ),
            StreamBuilder<List<ProductModel>?>(
                stream: bloc.allProducts,
                builder: (context, snp) {
                  return GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: islistGrid ? 2 : 1,
                    childAspectRatio: (itemWidth / itemHeight),
                    scrollDirection: Axis.vertical,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    children: [
                      ...List.generate(
                          snp.data?.length ?? 0,
                          (index) => ScreenProduct(
                              product: snp.data?[index] ?? ProductModel()))
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  AllProductsBloc get bloc => widget.bloc;
}
