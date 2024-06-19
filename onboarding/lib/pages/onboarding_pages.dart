import 'package:flutter/material.dart';
import 'package:onboarding/gen/assets.gen.dart';
import 'package:onboarding/constants/colors.dart';
import 'package:onboarding/gen/fonts.gen.dart';
import 'package:onboarding/pages/page_constructor.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageConstructor(
      title: 'Your first car without \na driver''s license', 
      titleFontFamily: FontFamily.abel, 
      titleFontWeight: FontWeight.w400,
      description: 'Goes to meet people who just got \ntheir license', 
      mainImagePath: Assets.images.png.firstPageMan.path, 
      page: 1,
      mainBackgroundColor: AppColors.firstPageMainColor,
    );
  }
}

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageConstructor(
      title: 'Always there: more than \n1000 cars in Tbilisi', 
      titleFontFamily: FontFamily.sfPro, 
      titleFontWeight: FontWeight.w700,
      description: 'Our company is a leader by the \nnumber of cars in the fleet', 
      mainImagePath: Assets.images.png.secondPageMan.path, 
      page: 2,
      mainBackgroundColor: AppColors.secondPageMainColor,
    );
  }
}

class OnboardingThirdPage extends StatelessWidget {
  const OnboardingThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageConstructor(
      title: 'Do not pay for parking, \nmaintenance and gasoline', 
      titleFontFamily: FontFamily.sfPro, 
      titleFontWeight: FontWeight.w700,
      description: 'We will pay for you, all expenses \nrelated to the car', 
      mainImagePath: Assets.images.png.thirdPageMan.path, 
      page: 3,
      mainBackgroundColor: AppColors.thirdPageMainColor,
    );
  }
}

class OnboardingFourthPage extends StatelessWidget {
  const OnboardingFourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageConstructor(
      title: '29 car models: from Skoda \nOctavia to Porsche 911', 
      titleFontFamily: FontFamily.sfPro, 
      titleFontWeight: FontWeight.w700,
      description: 'Choose between regular car models \nor exclusive ones', 
      mainImagePath: Assets.images.png.fourthPageMan.path, 
      page: 4,
      mainBackgroundColor: AppColors.lastPagesMainColor,
    );
  }
}

class OnboardingFifthPage extends StatelessWidget {
  const OnboardingFifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.lastPagesMainColor,
      body: Center(
        child: Text(
          'You are a clever person!',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 24, 
            fontWeight: FontWeight.w700,
            letterSpacing: -0.24,
            fontFamily: FontFamily.anekMalayalam,
          ),
        ),),
    );
  }
}