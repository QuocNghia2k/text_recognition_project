import '../../../../gen/assets.gen.dart';
import 'size_screen.dart';
import 'sort_screen.dart';
import '../../../../widgets/inkWell_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../resources/colors.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var localization = S.of(context);
    var theme = Theme.of(context);
    return SafeArea(
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        backgroundColor: AppColors.primaryWhite,
        alignment: Alignment.topCenter,
        insetPadding: EdgeInsets.all(1),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localization.filter,
                    style: theme.textTheme.headlineMedium,
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Assets.images.svg.icClose.svg())
                ],
              ),
              SortScreen(),
              SizeScreen(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWellWrapper(
                        paddingChild:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        onTap: () {},
                        child: Text(
                          localization.clear_all,
                          style: theme.textTheme.titleSmall,
                        )),
                    InkWellWrapper(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        localization.apply,
                        style: theme.textTheme.titleSmall,
                      ),
                      paddingChild:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: Border.all(color: AppColors.darkCharcoal),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
