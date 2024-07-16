import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tut/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:tut/presentation/resources/color_manager.dart';
import 'package:tut/presentation/resources/strings_manager.dart';
import 'package:tut/presentation/resources/values_manager.dart';
import 'package:tut/presentation/routes_manager.dart';

import '../../../domain/models/models.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind() {
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnBoardingViewObject>(
        stream: _onBoardingViewModel.outputOnBoardingViewObject,
        builder: (context, snapshot) {

          return _getContactWidget(snapshot.data);
        });
  }

  Widget _getContactWidget(OnBoardingViewObject? onBoardingViewObject) {
    if(onBoardingViewObject == null){
      return Container();
    }else{
      return Scaffold(
        backgroundColor: ColorManger.whit,
        appBar: AppBar(
          backgroundColor: ColorManger.whit,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManger.whit,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onBoardingViewObject.numOfSlides,
              onPageChanged: (index) {
                _onBoardingViewModel.changeCurrentIndex(index);
              },
              itemBuilder: (context, index) {
                return OnBoardingPage(
                  onBoardingViewObject.sliderObject,
                  context: context,
                );
              },
            ),
            Positioned(
              bottom: AppSize.s60,
              right: AppSize.s10,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      );
    }

  }
}

class OnBoardingPage extends StatelessWidget {
  final BuildContext context;
  final List<SliderObject> sliderObject;
  const OnBoardingPage(this.sliderObject, {required this.context, super.key});
  List<PageViewModel> get pages {
    return [
      for(int i = 0;i< sliderObject.length;i++ )

        PageViewModel(
          titleWidget: Text(
            sliderObject[i].title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          bodyWidget: Text(
            sliderObject[i].subtitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          image: SizedBox(
            height: 250, // Ensure all images have the same size
            child: SvgPicture.asset(
              sliderObject[i].imagePath,
            ),
          ),
          decoration: PageDecoration(
            pageColor: ColorManger.whit,
            contentMargin: const EdgeInsets.only(
                top: AppSize.s40,
                bottom: AppSize.s20), // Adjust padding as needed
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: ColorManger.primary,
      dotsDecorator: DotsDecorator(
          activeColor: ColorManger.whit, color: ColorManger.lightPrimary),
      pages: pages,
      showNextButton: true,
      showBackButton: true,
      // Set to false since we're showing the skip button
      showSkipButton: false,
      skip: const Text(
        AppStrings.skip,
      ),
      next: Icon(
        Icons.arrow_forward_ios,
        color: ColorManger.whit,
      ),
      back: Icon(
        Icons.arrow_back_ios,
        color: ColorManger.whit,
      ),
      // This will be hidden as showBackButton is false
      done: Text(
        AppStrings.done,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      onSkip: () {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      },
      onDone: () {
        // On done button pressed
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      },
    );
  }
}
