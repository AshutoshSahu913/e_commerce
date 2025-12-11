import 'package:e_commerce/screens/signup/widgets/sign_up_widget.dart';
import 'package:e_commerce/utils/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                buildThirdPartyLogin(context),
                SizedBox(height: 10.h),
                UiHelper.CustomTitleTxt(
                  title: "Or user your email account to login",
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiHelper.CustomTitleTxt(
                        title: "Email",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 10.h),
                      editFormTxt(
                        hint: 'Enter Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscure: false,
                        onSuffixTap: () {},
                        prefixIcon: Icons.email,
                      ),

                      SizedBox(height: 20.h),
                      UiHelper.CustomTitleTxt(
                        title: "Password",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 10.h),
                      editFormTxt(
                        hint: 'Enter Password',
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscure: true,
                        onSuffixTap: () {
                          setState(() {
                            isPassVisible = !isPassVisible;
                          });
                        },
                        prefixIcon: Icons.lock,
                        suffixIcon: isPassVisible
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                      ),
                      SizedBox(height: 20.h),
                      forgetPasswordWidget(() {
                        showAdaptiveAboutDialog(context: context);
                      }),

                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 10.h),
                    elevatedButton("Login", () {

                    }, "login"),
                    SizedBox(height: 10.h),
                    elevatedButton("SignUp", () {}, "signup"),
                  ],
                ),
              ],

            ),
          ),
        ),
      ),
      appBar: buildAppBar(),
    );
  }
}
