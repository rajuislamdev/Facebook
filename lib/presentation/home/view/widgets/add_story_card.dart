import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:facebook/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/text_style.dart';

class AddStoryCard extends StatelessWidget {
  const AddStoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(right: 5.w),
      width: 105.w,
      height: 185.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE4E6EB)),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ).copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero),
                  child: Container(
                    width: double.infinity,
                    color: Colors.red,
                    child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      imageUrl:
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Add Story', style: AppTextStyles.black12Bold700),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 35.h,
            left: 25.w,

            child: Assets.images.add.image(scale: 2.5),
          ),
        ],
      ),
    );
  }
}
