import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCacheNetwork extends StatelessWidget {
  const CustomCacheNetwork({
    super.key,
    required this.url,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.error,
    this.color,
    this.errorWidget,
    this.progressIndicatorBuilder,
  });

  final String url;
  final BorderRadiusGeometry? borderRadius;
  final String? error;
  final BoxFit? fit;
  final Color? color;
  final double? height, width;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(15),
      child: CachedNetworkImage(
        color: color,
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        errorWidget: errorWidget ??
            (BuildContext context, _, stackTrace) {
              return Image.asset(error ?? "assets/images/valid_image.png");
            },
        progressIndicatorBuilder: progressIndicatorBuilder ??
            (context, String url, DownloadProgress progress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
      ),
    );
  }
}
