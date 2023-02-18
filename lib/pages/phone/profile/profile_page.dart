import 'package:flutter/material.dart';

import '../../../blocs/blocs.dart';
import '../../../core/core.dart';
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
          Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 21),
              child: Column(
                children: [
                  ...List.generate(
                      data.length,
                      (index) => ExpansionItemOption(
                          headerValue: data[index].key,
                          expandValue: data[index].value))
                ],
              ))
        ],
      ),
    );
  }

  @override
  ProfileBloc get bloc => widget.profileBloc;
}
