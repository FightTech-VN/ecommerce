import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'carousel_slider_widget.dart';

class BannerCarouselSliderWidget extends StatefulWidget {
  final List<String> banners;
  final double ratio;
  final void Function(String)? onTap;
  final EdgeInsetsGeometry padding;
  final BorderRadius itemBorderRadius;
  final Color? inactiveIndicatorColor;
  final Color? activeIndicatorColor;
  final double viewportFraction;
  final Size activeSize;
  final BoxFit fit;

  const BannerCarouselSliderWidget({
    super.key,
    this.ratio = 2,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.itemBorderRadius = const BorderRadius.all(Radius.circular(8)),
    this.inactiveIndicatorColor = Colors.white,
    this.activeIndicatorColor = Colors.white,
    this.viewportFraction = 0.95,
    required this.banners,
    this.activeSize = const Size(12.0, 4.0),
    this.fit = BoxFit.fitWidth,
  });

  @override
  State<BannerCarouselSliderWidget> createState() =>
      _BannerCarouselSliderWidgetState();
}

class _BannerCarouselSliderWidgetState
    extends State<BannerCarouselSliderWidget> {
  var _pageCurrent = 0.0;
  final controller = CarouselController();

  late List<String> _banners;

  @override
  void initState() {
    _banners = widget.banners.where((element) => element.isNotEmpty).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_banners.isEmpty) {
      if (kDebugMode) {
        return Container(
          color: Colors.amber,
          child: const Text('empty list'),
        );
      }
      return const SizedBox();
    }

    return AspectRatio(
      aspectRatio: widget.ratio,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return CarouselSliderWidget(
                controller: controller,
                aspectRatio: widget.ratio,
                viewportFraction: 1.0,
                items: [
                  ..._banners.map(
                    (e) => Padding(
                      padding: widget.padding,
                      child: InkWell(
                        onTap: () {
                          if (widget.onTap != null) {
                            widget.onTap!(e);
                          } else {}
                        },
                        child: ImageWidget(
                          e,
                          fit: widget.fit,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  )
                ],
                onPageChanged: (index, reason) {
                  setState(() {
                    _pageCurrent = index.toDouble();
                  });
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(4.0).copyWith(bottom: 8),
            child: DotsIndicator(
              dotsCount: _banners.length,
              position: _pageCurrent,
              onTap: (position) {
                controller.jumpToPage(position.toInt());
              },
              decorator: DotsDecorator(
                color: widget.inactiveIndicatorColor ?? Colors.grey,
                activeColor: widget.activeIndicatorColor,
                activeSize: widget.activeSize,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.activeSize.width / 2)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.activeSize.width / 2)),
                ),
                size: const Size.square(4),
                spacing: const EdgeInsets.only(left: 2, top: 7, right: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
