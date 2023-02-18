import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../blocs/blocs.dart';
import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../resources/resources.dart';
import '../../../widgets/common_widget.dart';

class CartPage extends StatefulWidget {
  final CartBloc bloc;

  const CartPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends BaseState<CartPage, CartBloc> {
  TextEditingController couponCode = TextEditingController();
  List<OrderDetailsModel>? orderDetails;

  @override
  void dispose() {
    super.dispose();
    couponCode.dispose();
  }

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<OrderModel?>(
            stream: bloc.orderStream,
            builder: (context, snpOrder) {
              orderDetails = snpOrder.data?.orderDetails;
              return snpOrder.hasData
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 9),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          color: AppColors.darkCharcoal,
                          child: RichText(
                              text: TextSpan(
                                  text: localization.shop_for,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                      color: AppColors.primaryWhite,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                TextSpan(
                                    text:
                                        " ${localization.aed} ${bloc.state?.order?.feeShip} ${localization.more_free_ship}",
                                    style: theme.textTheme.labelSmall?.copyWith(
                                        color: AppColors.primaryWhite,
                                        fontWeight: FontWeight.w700))
                              ])),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 23, bottom: 16),
                            alignment: Alignment.center,
                            child: Text(localization.my_cart,
                                style: theme.textTheme.headlineSmall)),
                        ...List.generate(orderDetails?.length ?? 0, (index) {
                          var orderDetail = orderDetails?[index];
                          int count = orderDetail?.quantity ?? 0;
                          return Container(
                            color: AppColors.cultured,
                            child: CommonProduct(
                              product: orderDetail?.product,
                              orderCart: orderDetail?.quantity,
                              orderSize: orderDetail?.orderSize,
                              onChangeQuantityProduct: (value) {
                                if (count < value) {
                                } else {}
                              },
                            ),
                          );
                        }),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Row(children: [
                            Expanded(
                                child: CommonTextField(
                              textEditingController: couponCode,
                              hintText: localization.coupon_code,
                              borderColor: Colors.transparent,
                              focusBorderColor: Colors.transparent,
                              contentPadding: EdgeInsets.only(
                                  left: 24, top: 15, bottom: 15),
                            )),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: InkWellWrapper(
                                  color: AppColors.cultured,
                                  onTap: () {},
                                  border: Border.all(
                                      color: AppColors.primaryBlack, width: 1),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 13, horizontal: 23),
                                      child: Text(
                                        localization.apply,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                                color: AppColors.darkCharcoal),
                                      ))),
                            )
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 43),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          color: AppColors.cultured,
                          child: StreamBuilder<OrderModel?>(
                              stream: bloc.orderStream,
                              builder: (context, snapshot) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          localization.subtotal,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                  fontFamily: FontFamily.lato,
                                                  color: AppColors.dimGray,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${localization.aed} ${snapshot.data?.subTotal?.toStringAsFixed(2) ?? ""}",
                                            style: theme.textTheme.labelLarge
                                                ?.copyWith(
                                                    fontFamily: FontFamily.lato,
                                                    fontWeight:
                                                        FontWeight.w700),
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            localization.discount,
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                    fontFamily: FontFamily.lato,
                                                    color: AppColors.dimGray,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${localization.aed} ${snapshot.data?.discount?.toStringAsFixed(2) ?? ""}",
                                              style: theme.textTheme.labelLarge
                                                  ?.copyWith(
                                                      fontFamily:
                                                          FontFamily.lato,
                                                      fontWeight:
                                                          FontWeight.w700),
                                              textAlign: TextAlign.right,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          localization.total,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                  fontFamily: FontFamily.lato,
                                                  color: AppColors.dimGray,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${localization.aed} ${snapshot.data?.total?.toStringAsFixed(2) ?? ""}",
                                            style: theme.textTheme.labelLarge
                                                ?.copyWith(
                                                    fontFamily: FontFamily.lato,
                                                    fontWeight:
                                                        FontWeight.w700),
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ),
                        InkWellWrapper(
                          onTap: () {},
                          color: AppColors.primaryBlack,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              localization.process_to_payment,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryWhite),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SpinKitFadingCircle(color: AppColors.primaryBlack);
            }),
      ),
    );
  }

  @override
  CartBloc get bloc => widget.bloc;
}
