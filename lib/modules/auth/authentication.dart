import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_notes/common_widgets/loader.dart';
import 'package:personal_notes/core/constants/color_constants.dart';
import 'package:personal_notes/modules/auth/bloc/auth_bloc.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  late AuthBloc authBloc = context.read<AuthBloc>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc.add(RequestBioMetricEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.isLoading
              ? Column(
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
                )
              : Center(
                  child: Text(
                    "Successfully Verified",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: ColorConstants.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
