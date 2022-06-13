import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';

class BookmarkBox extends StatelessWidget {
  const BookmarkBox({Key? key, this.onTap, this.isBookmarked = false})
      : super(key: key);

  final GestureTapCallback? onTap;
  final bool isBookmarked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isBookmarked ? primary : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: SvgPicture.asset(
          AppConstants.bookmarkIcon,
          color: isBookmarked ? Colors.white : primary,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
