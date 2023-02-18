import 'package:flutter/material.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:text_recognition_project/blocs/blocs.dart';
import 'package:text_recognition_project/core/base/base.dart';
import 'package:text_recognition_project/gen/assets.gen.dart';

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
    return OnBoardingScreen(
      onSkip: () {
        Navigator.pushNamed(context, Routes.signin);
      },
      showPrevNextButton: true,
      showIndicator: true,
      backgourndColor: Colors.white,
      activeDotColor: Colors.blue,
      deactiveDotColor: Colors.grey,
      iconColor: Colors.black,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: [
        OnBoardingModel(
          image: Assets.images.svg.onboarding1.svg(),
          title: "Business Chat",
          body:
              "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
        ),
        OnBoardingModel(
          image: Assets.images.svg.onboarding2.svg(),
          title: "Coffee With Friends",
          body:
              "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
        ),
        OnBoardingModel(
          image: Assets.images.svg.onBoarding3.svg(),
          title: "Coffee With Friends",
          body:
              "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
        ),
      ],
    );
  }

  @override
  OnBoadingBloc get bloc => widget.bloc;
}
