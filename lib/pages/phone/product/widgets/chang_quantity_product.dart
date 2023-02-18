import '../../../../widgets/inkWell_wrapper.dart';
import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';

class ChangeQuantityProduct extends StatefulWidget {
  const ChangeQuantityProduct(
      {Key? key,
      this.onChangeQuantityProduct,
      required this.quantity,
      this.orderCart})
      : super(key: key);
  final int quantity;
  final int? orderCart;
  final Function(int)? onChangeQuantityProduct;

  @override
  State<ChangeQuantityProduct> createState() => _ChangeQuantityProductState();
}

class _ChangeQuantityProductState extends State<ChangeQuantityProduct> {
  late int countProduct = widget.orderCart ?? 1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(children: [
      InkWellWrapper(
        onTap: countProduct != widget.quantity
            ? () {
                setState(() {
                  countProduct++;
                });
                widget.onChangeQuantityProduct?.call(countProduct);
              }
            : null,
        border: Border.all(color: AppColors.primarySolidBorder, width: 1),
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Assets.images.svg.icPlus.svg(),
        ),
      ),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 9),
          child: Text(countProduct.toString(),
              style:
                  theme.textTheme.bodySmall?.copyWith(color: AppColors.onyx))),
      InkWellWrapper(
        onTap: countProduct != 1
            ? () {
          setState(() {
                  countProduct--;
                });
                widget.onChangeQuantityProduct?.call(countProduct);
              }
            : null,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.primarySolidBorder, width: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Assets.images.svg.icMinus.svg(),
        ),
      )
    ]);
  }
}
