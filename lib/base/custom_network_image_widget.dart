import '../../../utils/exports.dart';

/// baseNetworkImage widget
///
/// using this widget we can show loader while image is loading
/// we can caching the image and also handle error widget while
/// loading image url.
class CustomNetworkImageWidget extends StatelessWidget {
  const CustomNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderColor,
    this.color,
    this.shadow,
    this.borderWidth,
    this.radius,
    this.isDownloadPath = true,
    this.isShowPlaceHolder = false,
    required this.placeHolderImage,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final String imageUrl;
  final ImageWidgetBuilder? imageBuilder;
  final Widget? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final Widget? errorWidget;
  final List<BoxShadow>? shadow;
  final String placeHolderImage;
  final double? width;
  final double? borderWidth;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Color? borderColor;
  final bool isShowPlaceHolder;
  final Alignment alignment;
  final bool isDownloadPath;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: key,
      imageUrl: imageUrl,
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: borderWidth ?? 1),
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  4,
                ),
              ),
              image: DecorationImage(image: imageProvider, fit: fit),
              boxShadow: shadow),
        );
      },
      placeholder: (BuildContext context, String image) {
        return isShowPlaceHolder
            ? placeholder ??
                _placeHolderWidget(() {
                  return Image.asset(placeHolderImage, fit: BoxFit.fill);
                })
            : const CircularProgressIndicator(
                strokeWidth: 1,
              );
      },
      errorWidget: (
        BuildContext context,
        String url,
        dynamic error,
      ) {
        return errorWidget ??
            _placeHolderWidget(() {
              return Image.asset(placeHolderImage, fit: BoxFit.fill);
            });
      },
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
    );
  }

  Widget _placeHolderWidget(Widget Function() child) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor ?? Colors.transparent, width: borderWidth ?? 1),
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(
            4,
          ),
        ),
      ),
      child: child.call(),
    );
  }
}
