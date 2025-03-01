import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientAvatar extends StatelessWidget {
  final String image;
  const GradientAvatar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF4F46E5),
            Color(0xFFC622FF),
            Color(0xFFFF2222),
            Color(0xFFFFA439),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
      ),
    );
  }
}
