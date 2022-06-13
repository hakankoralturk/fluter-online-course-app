import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/ui/theme/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.data,
      required this.onTap,
      this.activeColor = primary,
      this.bgColor = Colors.white,
      this.isActive = false})
      : super(key: key);

  final data;
  final Color activeColor;
  final Color bgColor;
  final bool isActive;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? activeColor : bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.05),
              blurRadius: .5,
              spreadRadius: .5,
              offset: const Offset(1, 1),
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              data["icon"],
              color: isActive ? Colors.white : darker,
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data["name"],
              style: TextStyle(color: isActive ? Colors.white : darker),
            ),
          ],
        ),
      ),
    );
  }
}
