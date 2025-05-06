import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final RxDouble position;
  final double width;
  final double height;
  final double? radius;
  final Color color;
  final Color colorShadow;
  final Color? textColor;
  final String label;
  final String icon;

  const CustomImageButton({
    super.key,
    required this.position,
    this.width = 100.0,
    this.height = 100.0,
    required this.color,
    required this.colorShadow,
    required this.label,
    required this.onTap,
    this.radius,
    this.textColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const double shadowHeight = 4;
    double heightButton = height - shadowHeight;

    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        onTapUp: (_) {
          position.value = 4;
        },
        onTapDown: (_) {
          position.value = 0;
        },
        onTapCancel: () {
          position.value = 4;
        },
        child: SizedBox(
          height: heightButton + shadowHeight,
          width: width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: heightButton,
                  width: width,
                  decoration: BoxDecoration(
                    color: colorShadow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius ?? 16.0),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.easeIn,
                bottom: position.value.toDouble(),
                duration: const Duration(milliseconds: 70),
                child: Container(
                  height: heightButton,
                  width: width,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius ?? 16.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        icon,
                        height: 34.0,
                      ),
                      verticalSpace(8.0),
                      Text(
                        label,
                        style: blackSansitaRegularTextStyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: textColor ?? Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
