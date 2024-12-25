part of '../home_screen.dart';

class AddFirstNoteWidget extends StatelessWidget {
  const AddFirstNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: StringConstants.createYourFirstNotes,
          color: ColorConstants.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        10.verticalSpace,
        CustomText(
          text: StringConstants.addANotes,
          color: ColorConstants.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        24.verticalSpace,
        // SizedBox(
        //   height: 36.h,
        //   width: double.infinity,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       context.push("${Routes.home}/${Routes.addNotes}");
        //     },
        //     style: ButtonStyle(
        //       backgroundColor:
        //           WidgetStateProperty.all(ColorConstants.blackShaded),
        //     ),
        //     child: CustomText(
        //       text: StringConstants.createANote,
        //       fontSize: 14.sp,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
