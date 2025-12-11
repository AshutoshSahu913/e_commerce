import 'package:e_commerce/utils/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/constants/app_colors.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Center(
      child: UiHelper.CustomTitleTxt(
        title: "Login In",
        color: Colors.black,
        fontFamily: "bold",
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.1),
        //height define the thickness of line
        height: 1.0,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _circleIcons("assets/icons/google1.svg", () {}),
      _circleIcons("assets/icons/apple.svg", () {}),
      _circleIcons("assets/icons/fb.svg", () {}),
    ],
  );
}

Widget _circleIcons(String iconPath, VoidCallback onPress) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: IconButton(
      color: Colors.grey,
      onPressed: onPress,
      icon: Padding(
        padding: const EdgeInsets.all(5),
        child: SvgPicture.asset(iconPath, width: 24, height: 24),
      ),
      alignment: Alignment.center,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primarySecondaryBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );
}

// this custom textView
Widget editFormTxt({
  required String hint,
  required TextEditingController controller,
  bool obscure = false,
  TextInputType keyboardType = TextInputType.text,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? onSuffixTap,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null
          ? GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon))
          : null,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.primaryElement),
        gapPadding: 10,
      ),
      
      fillColor: Colors.white10,
    ),
  );
}

Widget forgetPasswordWidget(VoidCallback clickEvent) {
  return InkWell(
    onTap: () {
      clickEvent;
    },
    child: Text(
      "Forget Password?",
      style: TextStyle(
        color: AppColors.primaryElement,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget elevatedButton(String title, VoidCallback onPress, String textType) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: double.infinity, // FULL WIDTH
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: textType == "login" ? 2.0 : 0,
          backgroundColor: textType == "login"
              ? AppColors.primaryElement
              : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: textType == "login"
                  ? AppColors.primaryElement
                  : AppColors.primaryFourElementText,
              width: 1.w,
            ),
          ),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: textType == "login"
                ? "bold"
                : "regular",
            fontWeight: textType == "login"
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: 16,
            color: textType == "login"
                ? Colors.white
                : AppColors.primaryFourElementText,
          ),
        ),
      ),
    ),
  );
}
