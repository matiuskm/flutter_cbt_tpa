import 'package:cbt_tpa_app/core/assets/assets.gen.dart';
import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/data/datasources/onboarding/onboarding_local_datasource.dart';
import 'package:cbt_tpa_app/presentation/auth/pages/login_screen.dart';
import 'package:cbt_tpa_app/presentation/onboarding/models/onboard.dart';
import 'package:cbt_tpa_app/presentation/onboarding/widgets/dot_indicator.dart';
import 'package:cbt_tpa_app/presentation/onboarding/widgets/onboard_content.dart';
import 'package:cbt_tpa_app/presentation/onboarding/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigate() {
    context.pushReplacement(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.images.ornament.path,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SkipButton(onPressed: () {
                    OnboardingLocalDatasource().setAlreadyPassed();
                    navigate();
                  }),
                  Expanded(
                    child: PageView.builder(
                      itemCount: onboardData.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) => OnboardContent(
                        image: onboardData[index].image,
                        title: onboardData[index].title,
                        description: onboardData[index].description,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        onboardData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () {
                            if (_pageIndex < onboardData.length - 1) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            } else {
                              OnboardingLocalDatasource().setAlreadyPassed();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                          },
                          child: Image.asset(
                            Assets.icons.rightArrow.path,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Onboard> onboardData = [
  Onboard(
    image: Assets.images.onboard1.path,
    title: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB',
    description: '',
  ),
  Onboard(
    image: Assets.images.onboard2.path,
    title: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB',
    description: '',
  ),
  Onboard(
    image: Assets.images.onboard3.path,
    title: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB',
    description: '',
  ),
];
