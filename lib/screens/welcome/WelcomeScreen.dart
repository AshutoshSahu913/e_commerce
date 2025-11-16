import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/config/routes/RoutesName.dart';
import 'package:e_commerce/screens/welcome/bloc/welcome_blocs.dart';
import 'package:e_commerce/screens/welcome/bloc/welcome_events.dart';
import 'package:e_commerce/screens/welcome/bloc/welcome_states.dart';
import 'package:e_commerce/utils/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    context.read<WelcomeBloc>().add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "Welcome",
                      "This is the first onboarding screen.",
                      "image1.png",
                      "Next",
                    ),
                    _page(
                      2,
                      context,
                      "Discover",
                      "Find amazing products and great deals.",
                      "image2.png",
                      "Next",
                    ),
                    _page(
                      3,
                      context,
                      "Get Started",
                      "Enjoy the best shopping experience.",
                      "image3.png",
                      "Get Started",
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    animate: true,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: AppColors.primaryElement,
                      size: Size(8, 8),
                      activeSize: Size(30, 10),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String title,
    String subTitle,
    String imagePath,
    String btnTxt,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UiHelper.CustomImage(img: imagePath),

        UiHelper.CustomTitleTxt(
          title: title,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "bold",
        ),

        SizedBox(height: 20),
        UiHelper.CustomTitleTxt(
          title: subTitle,
          color: Colors.black,
          fontWeight: FontWeight.w100,
          fontSize: 14,
        ),
        SizedBox(height: 50),
        _elevatedButton(btnTxt, () {
          //within 0 - 2 index
          if (index < 3) {
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          } else {
            //navigate new page
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
            );
            print("navigate to next screen");
          }
        }),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _elevatedButton(String title, VoidCallback onPress) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity, // FULL WIDTH
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryElement,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPress,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "bold",
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
