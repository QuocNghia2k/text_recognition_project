import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';

class ExpansionItemOption extends StatefulWidget {
  const ExpansionItemOption(
      {Key? key, required this.headerValue, required this.expandValue})
      : super(key: key);

  final String headerValue;
  final dynamic expandValue;

  @override
  State<ExpansionItemOption> createState() => _ExpansionOptionItemState();
}

class _ExpansionOptionItemState extends State<ExpansionItemOption> {
  bool isExpanded = false;

  String get headerValue => widget.headerValue;

  dynamic get expandValue => widget.expandValue;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ExpansionTile(
      trailing: isExpanded
          ? Assets.images.svg.icMinus.svg(color: AppColors.primaryWhite)
          : Assets.images.svg.icPlus.svg(color: AppColors.davyGrey),
      backgroundColor: AppColors.darkCharcoal,
      collapsedBackgroundColor: AppColors.primaryWhite,
      title: Text(headerValue,
          style: theme.textTheme.labelLarge
              ?.copyWith(color: isExpanded ? AppColors.primaryWhite : null)),
      children: [
        if (expandValue is Iterable<dynamic>)
          ...List.generate(
              expandValue.length,
              (i) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 40),
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      border: Border.all(
                          width: 0.5, color: AppColors.columbiaBlue)),
                  child:
                      Text(expandValue[i], style: theme.textTheme.labelLarge)))
        else
          Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryWhite,
              padding: EdgeInsets.only(top: 15, bottom: 15, left: 40),
              child: Text(expandValue, style: theme.textTheme.labelLarge))
      ],
      onExpansionChanged: (bool expanded) {
        setState(() => isExpanded = expanded);
      },
    );
  }
}
