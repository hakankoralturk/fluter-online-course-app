import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';

class bottomBarItem extends StatelessWidget {
  const bottomBarItem({
    Key? key,
    required this.icon,
    this.activeColor = primary,
    this.color = Colors.grey,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  final String icon;
  final Color activeColor;
  final Color color;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
          ],
        ),
        child: SvgPicture.asset(icon, color: isActive ? activeColor : color),
      ),
    );
  }
}
