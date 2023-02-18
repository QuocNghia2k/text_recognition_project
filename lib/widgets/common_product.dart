import 'package:flutter/material.dart';
import '../data/data.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';
import '../generated/l10n.dart';
import '../pages/phone/product/widgets/chang_quantity_product.dart';
import '../resources/resources.dart';

class CommonProduct extends StatefulWidget {
  const CommonProduct(
      {Key? key,
      this.product,
      this.indexSize,
      this.indexSizeName,
      this.orderCart,
      this.orderSize,
      this.onChangeQuantityProduct})
      : super(key: key);
  final ProductModel? product;
  final int? indexSize;
  final int? indexSizeName;
  final int? orderCart;
  final OrderSizeModel? orderSize;
  final Function(int)? onChangeQuantityProduct;

  @override
  State<CommonProduct> createState() => _CommonProductState();
}

class _CommonProductState extends State<CommonProduct> {
  ProductModel? get product => widget.product;

  int? get indexSize => widget.indexSize;

  int? get indexSizeName => widget.indexSizeName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = S.of(context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          child: Row(children: [
            product?.images == null
                ? Assets.images.png.defaultImage
                    .image(width: 102, height: 102, fit: BoxFit.cover)
                : Image.network(product!.images![0], width: 98, height: 98),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(product?.brand ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelSmall?.copyWith(
                                  color: AppColors.slateGray,
                                  fontFamily: FontFamily.lato)),
                          Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(product?.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelLarge),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: widget.orderSize == null
                                ? Text(
                                    "${localization.size}: ${product?.productSizes?[indexSizeName ?? 0].size?[indexSize ?? 0] ?? ""} ${product?.productSizes?[indexSizeName ?? 0].name ?? ""}",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                        color: AppColors.slateGray,
                                        fontFamily: FontFamily.lato))
                                : Text(
                                    "${localization.size}: ${widget.orderSize?.name ?? ""} ${widget.orderSize?.size ?? ""}",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                        color: AppColors.slateGray,
                                        fontFamily: FontFamily.lato)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Row(
                              mainAxisAlignment:
                                  product?.discountPercent != null &&
                                          product?.discountPercent != 0
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.start,
                              children: [
                                Visibility(
                                    visible: product?.discountPercent != null &&
                                        product?.discountPercent != 0,
                                    child: Text(
                                        "${localization.aed}: ${product?.price?.toStringAsFixed(2)}",
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                                decoration: TextDecoration
                                                    .lineThrough))),
                                (product?.discountPercent == null ||
                                        product?.discountPercent == 0)
                                    ? Text(
                                    "${localization.aed} ${product?.price?.toStringAsFixed(2) ?? ""}",
                                        style: theme.textTheme.bodyLarge
                                            ?.copyWith(
                                                color: AppColors.primaryRed))
                                    : Text(
                                    "${localization.aed} ${product?.discountPrice?.toStringAsFixed(2) ?? ""}",
                                        style: theme.textTheme.bodyLarge
                                            ?.copyWith(
                                                color: AppColors.darkCharcoal))
                              ],
                            ),
                          )
                        ]))),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: ChangeQuantityProduct(
                  quantity: product?.quantity ?? 1,
                  orderCart: widget.orderCart,
                  onChangeQuantityProduct: (int value) {
                    widget.onChangeQuantityProduct?.call(value);
                  }),
            )
          ]),
        ),
        Visibility(
            visible: product?.discountPercent != null &&
                product?.discountPercent != 0,
            child: Positioned(
              top: 11,
              child: Container(
                color: AppColors.darkCharcoal,
                padding: EdgeInsets.all(3),
                child: Text(
                  "${product!.discountPercent.toString()}% ${localization.off}",
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 9),
                ),
              ),
            )),
      ],
    );
  }
}
