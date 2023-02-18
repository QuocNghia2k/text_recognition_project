import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resources/resources.dart';

class ExpantionOption extends StatefulWidget {
  final Widget icon;
  final OptionModel option;
  const ExpantionOption({required this.option, required this.icon, Key? key})
      : super(key: key);

  @override
  State<ExpantionOption> createState() => _ExpantionOptionState();
}

class _ExpantionOptionState extends State<ExpantionOption> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ExpansionTile(
      trailing: _customTileExpanded
          ? Assets.images.svg.icChevronDown.svg(width: 13)
          : Assets.images.svg.icArrowDown.svg(),
      onExpansionChanged: (bool expanded) {
        setState(() => _customTileExpanded = expanded);
      },
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 11),
            child: widget.icon,
          ),
          Text(
            widget.option.name ?? "",
            style: theme.textTheme.labelLarge,
          ),
        ],
      ),
      expandedAlignment: Alignment.centerLeft,
      children: List.generate(
        widget.option.topic?.length ?? 0,
        (indextopic) => ListTile(
          onTap: () {},
          title: Text(
            widget.option.topic?[indextopic] ?? "",
            style: theme.textTheme.labelLarge
                ?.copyWith(color: AppColors.darkSilver),
          ),
        ),
      ),
    );
  }
}
