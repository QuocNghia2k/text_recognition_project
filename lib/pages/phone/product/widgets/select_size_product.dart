import '../../../../widgets/inkWell_wrapper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../data/models/product_model.dart';
import '../../../../resources/colors.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class SelectSizeProduct extends StatelessWidget {
  SelectSizeProduct(
      {Key? key,
      required this.product,
      this.indexSize,
      this.onChangeIndexSizeName,
      this.onChangeIndexSize,
      this.indexSizeName})
      : super(key: key);
  final ProductModel? product;
  final int? indexSizeName;
  final int? indexSize;
  final Function(int)? onChangeIndexSizeName;
  final Function(int)? onChangeIndexSize;

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    var theme = Theme.of(context);
    var listTypeSize = product?.productSizes;
    var typeSize = listTypeSize?[indexSizeName ?? 0];
    return Padding(
        padding: EdgeInsets.only(top: 19, bottom: 16, left: 23, right: 27),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                  text: TextSpan(
                      text: "${localization.size}: ",
                      style: theme.textTheme.bodySmall,
                      children: [
                    TextSpan(
                        text:
                            "${(typeSize?.size?[indexSize ?? 0].toString() ?? "")} ${(typeSize?.name ?? "")}",
                        style: theme.textTheme.bodyMedium)
                  ])),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 17),
                      child: DropdownButton(
                        value: typeSize?.name?.toUpperCase(),
                        underline: SizedBox(),
                        alignment: AlignmentDirectional.topStart,
                        icon: Assets.images.svg.icDropDown
                            .svg(width: 11, height: 6, color: AppColors.onyx),
                        style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkCharcoal),
                        onChanged: (String? value) {
                          var index = listTypeSize?.indexWhere((e) =>
                              e.name?.toLowerCase() == value?.toLowerCase());
                          onChangeIndexSizeName?.call(index ?? 0);
                        },
                        items: listTypeSize?.map<DropdownMenuItem<String>>(
                            (ProductSize value) {
                          return DropdownMenuItem<String>(
                            alignment: AlignmentDirectional.centerStart,
                            value: value.name?.toUpperCase(),
                            enabled: value.name ==
                                    listTypeSize[indexSizeName ?? 0].name
                                ? false
                                : true,
                            child: Text(
                              value.name?.toUpperCase() ?? "",
                              style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkCharcoal),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 56,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                                child: InkWellWrapper(
                                    onTap: () => onChangeIndexSize?.call(index),
                                    color: indexSize == index
                                        ? AppColors.darkCharcoal
                                        : AppColors.primaryWhite,
                                    borderRadius: BorderRadius.circular(7),
                                    border: indexSize == index
                                        ? null
                                        : Border.all(
                                            color: AppColors.primaryGrey,
                                            width: 1),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              indexSize == index ? 17 : 16,
                                          vertical:
                                              indexSize == index ? 11 : 9),
                                      child: Text(
                                          typeSize?.size?[index].toString() ??
                                              "",
                                          style: theme.textTheme.labelSmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: indexSize == index
                                                      ? AppColors.primaryWhite
                                                      : AppColors.davyGrey)),
                                    )));
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 8.5),
                          itemCount: typeSize?.size?.length ?? 0),
                    ))
                  ])
            ]));
  }
}
