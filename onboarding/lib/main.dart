// ignore_for_file: sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/constants/colors.dart';
import 'package:onboarding/cubit/onboarding_cubit.dart';
import 'package:onboarding/pages/onboarding_pages.dart';
import 'package:onboarding/pages/page_constructor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => OnboardingCubit(),
        child: const OnboardingScreen(),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Widget> pages = [
    const OnboardingFirstPage(),
    const OnboardingSecondPage(),
    const OnboardingThirdPage(),
    const OnboardingFourthPage(),
    const OnboardingFifthPage(),
  ];

  final PageController _pageController = PageController();

  Color getMainBackgroundColor(int page) {
    switch (page) {
      case 1:
        return AppColors.firstPageMainColor;
      case 2:
        return AppColors.secondPageMainColor;
      case 3:
        return AppColors.thirdPageMainColor;
      case 4:
        return AppColors.lastPagesMainColor;
      default:
        return AppColors.whiteColor;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OnboardingCubit, int>(
        listener: (context, state) {
          _pageController.animateToPage(
            state,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: BlocBuilder<OnboardingCubit, int>(
          builder: (context, state) {
            return ColoredBox(              
              color: getMainBackgroundColor(state + 1),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: pages,
                  ),
                ),
                if (state < 4)
                  PageBottom(
                    mainBackgroundColor: getMainBackgroundColor(state + 1),
                    controller: _pageController,
                    page: state + 1,
                    onPressedSkip: () {
                      context.read<OnboardingCubit>().skip();
                    },
                    onTapNextPage: () =>
                        context.read<OnboardingCubit>().nextPage(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}