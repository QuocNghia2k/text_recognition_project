import '../../../../gen/assets.gen.dart';
import '../../../../resources/resources.dart';
import '../../../../widgets/inkWell_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class SortScreen extends StatefulWidget {
  const SortScreen({Key? key}) : super(key: key);

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  List<bool> choses = [true, false, false];
  List<String> title = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    var theme = Theme.of(context);
    title = [
      localization.popularity,
      "${localization.price}: ${localization.high} - ${localization.low}",
      "${localization.price}: ${localization.low} - ${localization.high}"
    ];
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.sort_by,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(
            height: 7.5,
          ),
          ...List.generate(
            choses.length,
            (index) => InkWellWrapper(
              paddingChild: EdgeInsets.symmetric(vertical: 7.5),
              onTap: () {
                setState(() {
                  choses = [false, false, false];
                  choses[index] = !choses[index];
                });
              },
              child: Row(
                children: [
                  choses[index]
                      ? Assets.images.svg.icChose.svg()
                      : Assets.images.svg.icUnchose.svg(),
                  Padding(
                    padding: EdgeInsets.only(left: 20.5),
                    child: Text(
                      title[index],
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7.5,
          ),
          Divider(
            color: AppColors.platinum,
          )
        ],
      ),
    );
  }
}
