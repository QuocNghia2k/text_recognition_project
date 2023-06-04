import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resources/colors.dart';

class PersonAvatar extends StatelessWidget {
  final String emailUser;
  const PersonAvatar({required this.emailUser, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 6),
          child: Assets.images.png.logo.image(height: 150, width: 400),
        ),
        Text(emailUser, style: theme.textTheme.bodySmall),
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
