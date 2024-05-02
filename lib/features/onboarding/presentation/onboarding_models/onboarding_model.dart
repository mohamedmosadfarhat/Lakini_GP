class OnboardinData {
  final String description;
  final String imageUrl;

  OnboardinData({
    required this.description,
    required this.imageUrl,
  });
}

final List<OnboardinData> myData = [
  OnboardinData(
    description:
        "Simply tag your belongings with our smart trackers and let Lakini do the rest",
    imageUrl: "assets/onboarding1.png",
  ),
  OnboardinData(
    description:
        "Whether it's at home, the office, or across the globe, Lakini has you covered. Track your items anytime, anywhere",
    imageUrl: "assets/onboarding2.png",
  ),
  OnboardinData(
    description:
        'Receive instant alerts when your belongings are detected nearby. Say goodbye to the stress of searching for lost items.',
    imageUrl: "assets/onboarding3.png",
  ),
];
