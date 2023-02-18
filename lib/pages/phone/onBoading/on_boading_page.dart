import 'package:flutter/material.dart';
import 'package:text_recognition_project/blocs/blocs.dart';
import 'package:text_recognition_project/core/base/base.dart';

import '../../../router/router.dart';

class OnBoadingPage extends StatefulWidget {
  final OnBoadingBloc bloc;
  const OnBoadingPage(this.bloc, {super.key});

  @override
  State<OnBoadingPage> createState() => _OnBoadingPageState();
}

class _OnBoadingPageState extends BaseState<OnBoadingPage, OnBoadingBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signin);
          },
          child: Text(
            "Sign in",
            style: theme.textTheme.bodyMedium?.copyWith(),
          ),
        ),
      ),
    );
  }

  @override
  OnBoadingBloc get bloc => widget.bloc;
}
