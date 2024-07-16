import 'dart:async';

import 'package:tut/presentation/base/baseviewmodel.dart';

import '../../../domain/models/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // use stream controller

  final StreamController _streamController =
      StreamController<OnBoardingViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //

// onboarding view model inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // start job
    _list = sliderObject();
    _postDataToView();
  }

  @override
  void changeCurrentIndex(int index) {
    _currentIndex = index;
    _postDataToView();
  }

// inputs
  @override
  Sink get inputOnBoardingViewObject => _streamController.sink;

  // outputs
  @override
  Stream<OnBoardingViewObject> get outputOnBoardingViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

// onboarding function

  List<SliderObject> sliderObject() => [
        SliderObject(AppStrings.onboardingTitle1,
            AppStrings.onboardingSubtitle1, ImagesAssets.onboardingLogo1),
        SliderObject(AppStrings.onboardingTitle2,
            AppStrings.onboardingSubtitle2, ImagesAssets.onboardingLogo2),
        SliderObject(AppStrings.onboardingTitle3,
            AppStrings.onboardingSubtitle3, ImagesAssets.onboardingLogo3),
        SliderObject(AppStrings.onboardingTitle4,
            AppStrings.onboardingSubtitle4, ImagesAssets.onboardingLogo4),
      ];

  // post data to view
  void _postDataToView() {
    inputOnBoardingViewObject
        .add(OnBoardingViewObject(_list, _list.length, _currentIndex));
  }
}

mixin OnBoardingViewModelInputs {
  void changeCurrentIndex(int index); // change current page index

  // stream controller input
  Sink get inputOnBoardingViewObject;
}
mixin OnBoardingViewModelOutputs {
  Stream<OnBoardingViewObject> get outputOnBoardingViewObject;
}
