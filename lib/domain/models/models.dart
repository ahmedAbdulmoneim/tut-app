// on boarding models



class OnBoardingViewObject {
  List<SliderObject> sliderObject;

  int numOfSlides;

  int currentIndex;

  OnBoardingViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

class SliderObject {
  String title;
  String subtitle;
  String imagePath;

  SliderObject(this.title, this.subtitle, this.imagePath);
}
