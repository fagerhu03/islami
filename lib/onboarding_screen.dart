import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/home/home.dart';
import 'package:islami/thems/app_color.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "/onbording";

  const OnboardingScreen({super.key});

  Widget _buildImage(String index) {
    return Image.asset('assets/images/welcom_images/welcom_$index.png');
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: "janna",
      color: AppColors.textPrimary,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontFamily: "janna",
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: AppColors.background,
      imagePadding: EdgeInsets.zero,
      imageFlex: 3,
    );

    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/welcom_images/onboarding_header.png"),
      globalBackgroundColor: AppColors.background,
      allowImplicitScrolling: true,
      infiniteAutoScroll: false,
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage('1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('3'),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage('4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('5'),
          decoration: pageDecoration,
        ),
      ],
      showDoneButton: true,
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      done: Text(
        "Finish",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontFamily: "janna",
          color: AppColors.textPrimary,
        ),
      ),
      showNextButton: true,
      next: Text(
        "Next",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontFamily: "janna",
          color: AppColors.textPrimary,
        ),
      ),
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          fontFamily: "janna",
          color: AppColors.textPrimary,
        ),
      ),
      onSkip: () {},
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text(
        'Skip',
        style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      fontFamily: "janna",
        color: AppColors.textPrimary,
      ),      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.accent,
        color: AppColors.gray,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
