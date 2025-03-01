import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final double width;
  final double height;
  final String? image;
  const ProfileAvatar({
    super.key,
    this.width = 41,
    this.height = 41,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            image ??
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
          ),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0x5FCCCCCC)),
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
    );
  }
}
