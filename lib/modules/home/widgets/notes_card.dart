part of '../home_screen.dart';

class NoteCard extends StatelessWidget {
  final String dates;
  final String notes;

  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const NoteCard({
    super.key,
    required this.dates,
    required this.notes,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: ColorConstants.blackShaded,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                text: dates,
                color: ColorConstants.grey,
                fontSize: 12.sp,
              ),
              const Spacer(),
              InkWell(
                onTap: onDelete,
                child: Icon(
                  Icons.delete,
                  color: ColorConstants.grey,
                  size: 18.h,
                ),
              ),
              14.horizontalSpace,
              InkWell(
                onTap: onEdit,
                child: Icon(
                  Icons.edit,
                  color: ColorConstants.grey,
                  size: 18.h,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          CustomText(
            text: notes,
            color: ColorConstants.white,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }
}
