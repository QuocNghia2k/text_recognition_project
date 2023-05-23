import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../core/core.dart';
import '../../../resources/colors.dart';
import '../../../router/router.dart';
import '../../../widgets/inkWell_wrapper.dart';
import 'widget/expansion_option.dart';
import 'widget/person_avatar.dart';

class ProfilePage extends StatefulWidget {
  final ProfileBloc profileBloc;

  const ProfilePage(this.profileBloc, {Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage, ProfileBloc> {
  final Map<String, dynamic> options = {
    "Overview": "abc",
    "Profile": ["My Preferences", "Address Book", "Saved Cards"],
    "Setting": "def"
  };
  late final data;

  @override
  void initState() {
    super.initState();
    data = options.entries.toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PersonAvatar(),
          // Padding(
          //     padding: EdgeInsets.symmetric(vertical: 24, horizontal: 21),
          //     child: Column(
          //       children: [
          //         ...List.generate(
          //             data.length,
          //             (index) => ExpansionItemOption(
          //                 headerValue: data[index].key,
          //                 expandValue: data[index].value))
          //       ],
          //     ))
          InkWellWrapper(
            color: AppColors.primaryBlack,
            child: Text(
              "Sign out",
              style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
            ),
            onTap: _signOut,
            paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
          ),
        ],
      ),
    );
  }

  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, Routes.signin);
  }

  @override
  ProfileBloc get bloc => widget.profileBloc;
}
