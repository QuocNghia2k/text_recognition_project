import '../../../data/data.dart';
import '../../../router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../blocs/blocs.dart';
import '../../../core/core.dart';
import '../../../gen/assets.gen.dart';
import '../../../resources/colors.dart';
import 'widgets/widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage(this.bloc, {Key? key}) : super(key: key);
  final ProductBloc bloc;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BaseState<ProductPage, ProductBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
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
        child: StreamBuilder<ProductModel?>(
            stream: bloc.productStream,
            builder: (context, snpProduct) {
              return snpProduct.hasData
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StreamBuilder<int?>(
                            stream: bloc.indexImageDisplayHeaderStream,
                            builder: (context, snapshot) {
                              return ImageProduct(
                                  product: snpProduct.data,
                                  indexImage: snapshot.data,
                                  onImageChange: (index) =>
                                      bloc.setIndexImage(index));
                            }),
                        InfoProduct(product: snpProduct.data),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 0.5,
                            color: AppColors.primaryGrey),
                        StreamBuilder<int?>(
                          stream: bloc.indexSizeNameStream,
                          builder: (context, snpSizeName) {
                            return StreamBuilder<int?>(
                              stream: bloc.indexSizeStream,
                              builder: (context, snpSize) {
                                return SelectSizeProduct(
                                    product: snpProduct.data,
                                    indexSize: snpSize.data,
                                    onChangeIndexSizeName: (value) {
                                      bloc.setIndexSizeName(value);
                                    },
                                    onChangeIndexSize: (value) {
                                      bloc.setIndexSize(value);
                                    },
                                    indexSizeName: snpSizeName.data);
                              },
                            );
                          },
                        ),
                        OrderProduct(
                          onTapShoppingCart: () {
                            showGeneralDialog(
                              barrierLabel: "Shop",
                              barrierDismissible: true,
                              barrierColor:
                                  AppColors.primaryBlack.withOpacity(0.63),
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              context: context,
                              pageBuilder: (context, _, __) {
                                return CustomDialog(
                                    product: snpProduct.data,
                                    indexSize: bloc.state?.indexSize,
                                    indexSizeName: bloc.state?.indexSizeName,
                                    onCheckoutTap: (value) =>
                                        Navigator.pushNamed(
                                            context, Routes.cart));
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
                          onTapBuyProduct: () {},
                        ),
                      ],
                    )
                  : SpinKitFadingCircle(color: AppColors.primaryBlack);
            }),
      ),
    );
  }

  @override
  ProductBloc get bloc => widget.bloc;
}
