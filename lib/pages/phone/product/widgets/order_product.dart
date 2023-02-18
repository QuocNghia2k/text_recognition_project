import '../../../../widgets/inkWell_wrapper.dart';
import '../../../../resources/resources.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct(
      {Key? key,
      required this.onTapShoppingCart,
      required this.onTapBuyProduct})
      : super(key: key);
  final Function() onTapShoppingCart;
  final Function() onTapBuyProduct;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localization = S.of(context);
    return Row(
      children: [
        InkWellWrapper(
          onTap: onTapShoppingCart,
          color: AppColors.cultured,
          child: Padding(
              child: Center(
                child: Icon(Icons.shopping_cart,
                    color: AppColors.quickSilver, size: 25),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 33)),
        ),
        Expanded(
            child: InkWellWrapper(
                onTap: onTapBuyProduct,
                color: AppColors.darkCharcoal,
                child: Padding(
                    child: Text(localization.buy_now,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall?.copyWith(
                            color: AppColors.cultured,
                            fontWeight: FontWeight.w400)),
                    padding: EdgeInsets.symmetric(vertical: 18))))
      ],
    );
  }
}
