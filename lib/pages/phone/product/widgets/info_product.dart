import '../../../../data/data.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/resources.dart';
import 'package:flutter/material.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({Key? key, this.product}) : super(key: key);
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 21, horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product?.brand ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.titleSmall?.copyWith(
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w400,
                  color: AppColors.slateGray)),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(product?.name ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: theme.textTheme.headlineSmall),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${localization.aed} ${(product?.price?.toStringAsFixed(2) ?? "")}",
                    style: theme.textTheme.titleSmall?.copyWith(
                        fontFamily: FontFamily.lato,
                        color: AppColors.slateGray,
                        decoration: (product?.discountPrice != null &&
                                product?.discountPrice != 0)
                            ? TextDecoration.lineThrough
                            : null)),
                Visibility(
                    visible: product?.discountPrice != null &&
                        product?.discountPrice != 0,
                    child: Text(
                        "${localization.aed} ${(product?.discountPrice?.toStringAsFixed(2))}",
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontFamily: FontFamily.lato))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
