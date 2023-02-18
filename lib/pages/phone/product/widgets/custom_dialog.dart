import '../../../../widgets/common_product.dart';
import '../../../../widgets/inkWell_wrapper.dart';
import 'package:flutter/material.dart';
import '../../../../data/data.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.product,
      this.indexSizeName,
      this.indexSize,
      this.onCheckoutTap})
      : super(key: key);
  final ProductModel? product;
  final int? indexSizeName;
  final int? indexSize;
  final Function(int)? onCheckoutTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = S.of(context);
    int quantityProduct = 1;
    return SafeArea(
        child: Dialog(
      backgroundColor: AppColors.primaryWhite,
      alignment: Alignment.topCenter,
      insetPadding: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                Assets.images.svg.icTick
                    .svg(width: 15, height: 11, color: AppColors.primaryGreen),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(localization.added_to_cart,
                        style: theme.textTheme.headlineMedium
                            ?.copyWith(fontFamily: FontFamily.lato)))
              ]),
              Container(
                color: AppColors.cultured,
                margin: EdgeInsets.symmetric(vertical: 22),
                child: CommonProduct(
                  product: product,
                  indexSize: indexSize,
                  indexSizeName: indexSizeName,
                  onChangeQuantityProduct: (value) {
                    quantityProduct = value;
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWellWrapper(
                    onTap: () {
                      onCheckoutTap?.call(quantityProduct);
                    },
                    border: Border.all(color: AppColors.primaryBlack, width: 1),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text(
                        localization.check_out,
                        style: theme.textTheme.bodySmall,
                      ),
                    )),
              )
            ]),
      ),
    ));
  }
}
