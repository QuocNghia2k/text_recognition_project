import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/resources.dart';
import '../../../../widgets/inkwell_wrapper.dart';

class SizeScreen extends StatefulWidget {
  const SizeScreen({Key? key}) : super(key: key);

  @override
  State<SizeScreen> createState() => _SizeScreenState();
}

class _SizeScreenState extends State<SizeScreen> {
  var indexSizeName = 0;
  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 5;
    var listTypeSize = [
      ProductSize(name: "US", size: [35, 36, 37, 38, 39, 41, 42, 43, 44, 45]),
      ProductSize(name: "Uk", size: [35, 36, 37, 38, 39, 41, 42, 43, 44, 45])
    ];
    var checkListTypeSize = [
      ProductSize(name: "US", size: []),
      ProductSize(name: "Uk", size: [])
    ];
    var typeSize = listTypeSize[indexSizeName];
    var typeSizeSelect = checkListTypeSize[indexSizeName];

    return Column(
      children: [
        Row(
          children: [
            Text(
              localization.size,
              style: theme.textTheme.titleSmall,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 17, left: 16),
              child: DropdownButton<String>(
                value: typeSize.name?.toUpperCase(),
                underline: SizedBox(),
                alignment: AlignmentDirectional.topStart,
                icon: Assets.images.svg.icDropDown
                    .svg(width: 11, height: 6, color: AppColors.onyx),
                style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.darkCharcoal),
                onChanged: (String? value) {
                  var index = listTypeSize.indexWhere(
                      (e) => e.name?.toLowerCase() == value?.toLowerCase());
                  setState(() {
                    indexSizeName = index;
                    listTypeSize[indexSizeName].size = [];
                  });
                  // onChangeIndexSizeName?.call(index ?? 0);
                  print("size screen: ${value}");
                },
                items: listTypeSize
                    .map<DropdownMenuItem<String>>((ProductSize value) {
                  return DropdownMenuItem<String>(
                    alignment: AlignmentDirectional.centerStart,
                    value: value.name?.toUpperCase(),
                    enabled: value.name == listTypeSize[indexSizeName].name
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
          ],
        ),
        GridView.count(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 1),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          // childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          children: [
            ...List.generate(typeSize.size?.length ?? 0, (index) {
              bool ischeck =
                  typeSizeSelect.size?.contains(typeSize.size?[index] ?? 0) ??
                      false;
              return Center(
                child: InkWellWrapper(
                  onTap: () {
                    setState(() {
                      typeSizeSelect.size?.add(typeSize.size?[index] ?? 0);
                    });
                  },
                  color:
                      ischeck ? AppColors.darkCharcoal : AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(7),
                  border: ischeck
                      ? null
                      : Border.all(color: AppColors.primaryGrey, width: 1),
                  paddingChild:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 19),
                  child: Text(
                    typeSize.size?[index].toString() ?? "",
                    style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ischeck
                            ? AppColors.primaryWhite
                            : AppColors.davyGrey),
                  ),
                ),
              );
            })
          ],
        ),
      ],
    );
  }
}
