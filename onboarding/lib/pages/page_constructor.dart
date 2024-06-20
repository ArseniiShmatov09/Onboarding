// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:onboarding/constants/colors.dart';
import 'package:onboarding/gen/fonts.gen.dart';
import 'package:onboarding/widgets/transition_button.dart';

class PageConstructor extends StatelessWidget {
  final String title;
  final String description;
  final Color? mainBackgroundColor;
  final String mainImagePath;
  final int page;
  final String titleFontFamily;
  final FontWeight titleFontWeight;
  
  const PageConstructor({
    super.key, 
    required this.title, 
    required this.description, 
    this.mainBackgroundColor, 
    required this.mainImagePath, 
    required this.page, 
    required this.titleFontFamily, 
    required this.titleFontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60,),
          PageHatText(
            title: title, 
            description: description, 
            titleFontFamily: titleFontFamily, 
            titleFontWeight: titleFontWeight,
          ),
          const SizedBox(height: 15,),
          Image.asset(mainImagePath),
          // PageBottom(
          //   page: page, 
          //   onPressedSkip:() => context.read<OnboardingCubit>().skip(), 
          //   onTapNextPage:() => context.read<OnboardingCubit>().nextPage(), 
          //   mainBackgroundColor: mainBackgroundColor,
          // ),
        ],
      ),
    );
  }
}

class PageHatText extends StatelessWidget {
 
  final String title;
  final String description;
  final String titleFontFamily;
  final FontWeight titleFontWeight;
  
  const PageHatText({
    super.key, 
    required this.title, 
    required this.description, 
    required this.titleFontFamily, 
    required this.titleFontWeight, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 28, 
              fontWeight: titleFontWeight,
              letterSpacing: 0.24,
              fontFamily: titleFontFamily,
            ),
          ),
          const SizedBox(height: 15,),
          Text(
            description,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18, 
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.sfPro,
            ),
          )
        ],
      ),
    );
  }
}

class PageBottom extends StatelessWidget {

  final Color mainBackgroundColor;
  final int page;
  final void Function()? onTapNextPage;
  final void Function()? onPressedSkip;
  final PageController controller;

  const PageBottom({
    super.key,
    required this.mainBackgroundColor,
    required this.page,
    required this.onTapNextPage,
    required this.onPressedSkip, 
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.whiteColor,
                  dotColor: AppColors.fadedWhiteColor,
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: onPressedSkip,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0.0),
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.abel,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          TransitionButton(
            page: page, 
            iconColor: mainBackgroundColor,
            onTapNextPage: onTapNextPage,
          ),
        ],
      ),
    );
  }
}
