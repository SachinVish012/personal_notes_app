import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_notes/common_widgets/loader.dart';
import 'package:personal_notes/core/constants/color_constants.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ShowLoader(),
          10.verticalSpace,
          Text(
            "Verifying...",
            style: TextStyle(
              fontSize: 18.sp,
              color: ColorConstants.white,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
