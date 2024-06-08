import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/color_helper.dart';

class CustomCachedImage extends StatelessWidget {
  final String src;
  final double height, width;
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );

  CustomCachedImage(
      {required this.src, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: customCacheManager,
      key: UniqueKey(),
      imageUrl: src,
      height: height,
      width: width,
      fit: BoxFit.fill,
      placeholder:
          (context, url) => Shimmer.fromColors(
        baseColor: ColorHelper.primary,
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: 290.w,
        height: 145.h,
        child: SvgPicture.asset(
          'assets/images/ad_placeholder_error_icon.svg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
