import 'package:flutter/material.dart';
import 'package:flutter_app/services/dio_client.dart';

class ImageComponent extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final AspectRatio? aspectRatio;

  const ImageComponent({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.aspectRatio,
  });

  ImageLoadingBuilder _imageLoadingBuilder() {
    return (context, image, loadingProgress) {
      if (loadingProgress == null) {
        return image;
      }
      return const Center(child: CircularProgressIndicator());
    };
  }

  ImageErrorWidgetBuilder _imageErrorBuilder() {
    return (context, error, stackTrace) {
      return const Center(child: Icon(Icons.error, color: Colors.red));
    };
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio?.aspectRatio ?? 1,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Image.network(
          dioClient.getFileUrl(imageUrl),
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          loadingBuilder: _imageLoadingBuilder(),
          errorBuilder: _imageErrorBuilder(),
        ),
      ),
    );
  }
}
