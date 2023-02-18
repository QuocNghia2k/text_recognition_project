import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/colors.dart';
import '../../../../router/router.dart';
import '../../../../widgets/inkWell_wrapper.dart';

class ScreenProduct extends StatelessWidget {
  final ProductModel? product;
  ScreenProduct({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWellWrapper(
      onTap: () {
        Navigator.pushNamed(context, Routes.product);
      },
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Image.network(
                  product?.images?[1] ?? "",
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 16, top: 13),
                      child: Assets.images.svg.icStar.svg()),
                ),
                Visibility(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 13),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      color: AppColors.primaryBlack,
                      child: RichText(
                        text: TextSpan(
                          style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 11, color: AppColors.primaryWhite),
                          children: [
                            TextSpan(text: "${product?.discountPercent}% off")
                          ],
                        ),
                      ),
                    ),
                  ),
                  visible: product?.discountPrice == null ? false : true,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.brand ?? "",
                    style: theme.textTheme.labelSmall,
                  ),
                  Text(
                    product?.name ?? "",
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: product?.discountPrice == null ? false : true,
                        child: Text(
                          "${S.of(context).aed} ${product?.price}",
                          style: theme.textTheme.labelSmall?.copyWith(
                              fontFamily: FontFamily.lato,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      product?.discountPrice == null
                          ? Text(
                              "${S.of(context).aed} ${product?.price}",
                              style: theme.textTheme.bodyLarge,
                            )
                          : Text(
                              "${S.of(context).aed} ${product?.discountPrice}",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.primaryRed,
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
