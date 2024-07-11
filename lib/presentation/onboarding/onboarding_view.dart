import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut/presentation/resources/color_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.whit,
      body: Center(child: Text('Onboarding screen')),
    );
  }
}
