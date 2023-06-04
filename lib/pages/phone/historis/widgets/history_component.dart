import 'package:flutter/material.dart';
import '../../../../data/data.dart';
import '../../../../extensions/extensions.dart';

import '../../../../resources/resources.dart';
import '../../../../widgets/inkwell_wrapper.dart';

class HistoryComponent extends StatelessWidget {
  final HistoryModel? historyModel;
  final Function()? onTap;
  final Function(HistoryModel)? onDelete;
  final Function(HistoryModel)? onUpdate;

  const HistoryComponent({required this.historyModel, this.onTap, this.onDelete, this.onUpdate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWellWrapper(
      border: Border.all(width: 2.0, color: AppColors.primaryBlack),
      color: AppColors.primaryWhite,
      child: Row(
        children: [
          Icon(
            Icons.file_open,
            color: AppColors.primaryBlack,
            size: 24.0,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                "${historyModel?.nameFile ?? "NoName"}.txt",
                style: theme.textTheme.titleSmall?.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${historyModel?.timeCreate?.convertDateFormat()}",
                style: theme.textTheme.titleSmall?.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w200, fontSize: 10),
              ),
            ],
          )),
          InkWellWrapper(
            onTap: () {
              onUpdate?.call(historyModel!);
            },
            margin: EdgeInsets.only(right: 5),
            paddingChild: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            color: AppColors.primaryBlue,
            child: Column(
              children: [
                Icon(
                  Icons.edit_document,
                  color: AppColors.primaryBlack,
                  size: 24.0,
                ),
              ],
            ),
          ),
          InkWellWrapper(
            onTap: () {
              onDelete?.call(historyModel!);
            },
            paddingChild: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            color: AppColors.primaryRed,
            child: Column(
              children: [
                Icon(
                  Icons.delete_outline_outlined,
                  color: AppColors.primaryBlack,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: onTap,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
    );
  }
}
