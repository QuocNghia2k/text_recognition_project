import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 28, bottom: 6),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43'),
                radius: 48,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: AppColors.darkCharcoal,
                        borderRadius: BorderRadius.circular(50)),
                    child: Assets.images.svg.icMaterialEdit.svg()),
              )
            ],
          ),
        ),
        Text('Jane Smith Doe', style: theme.textTheme.bodySmall),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(
            width: 0.5,
            color: AppColors.columbiaBlue,
          )),
        )
      ],
    );
  }
}
