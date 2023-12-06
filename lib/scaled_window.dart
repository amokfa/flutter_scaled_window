import 'package:flutter/widgets.dart';

/// Render an app/widget at a custom resolution.
///
/// This widget expands to fill all available space. Incoming constraints
/// must not be unbounded.
class ScaledWindow extends StatelessWidget {
  /// The color to use for rendering unused space. Default is transparent.
  final Color barrierColor;

  /// The resolution at which to render the child.
  final Size resolution;

  final Widget Function(BuildContext context, double scale) builder;

  const ScaledWindow({
    Key? key,
    this.barrierColor = const Color.fromARGB(0, 0, 0, 0),
    this.resolution = const Size(640, 480),
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var ratioW = constraints.maxWidth / resolution.width;
        var ratioH = constraints.maxHeight / resolution.height;
        var blockIsVertical = ratioW > ratioH;
        double w, h;
        if (blockIsVertical) {
          h = constraints.maxHeight;
          w = h * resolution.width / resolution.height;
        } else {
          w = constraints.maxWidth;
          h = w * resolution.height / resolution.width;
        }
        if (w > resolution.width) {
          w = resolution.width.toDouble();
          h = resolution.height.toDouble();
        }

        final windowScale = w / resolution.width;

        final originalMediaQuery = context.dependOnInheritedWidgetOfExactType<MediaQuery>()?.data ?? const MediaQueryData();
        return Container(
          alignment: Alignment.center,
          color: barrierColor,
          child: SizedBox(
            width: w,
            height: h,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Stack(
                children: [
                  const Center(),
                  Positioned(
                    top: (resolution.height - h) / -2,
                    left: (resolution.width - w) / -2,
                    width: resolution.width.toDouble(),
                    height: resolution.height.toDouble(),
                    child: Transform.scale(
                      scale: windowScale,
                      child: MediaQuery(
                        data: originalMediaQuery.copyWith(size: resolution),
                        child: Container(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: builder(context, windowScale),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
