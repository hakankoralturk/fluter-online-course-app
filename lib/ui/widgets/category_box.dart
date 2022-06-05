import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_app/ui/theme/colors.dart';

class CategoriesBox extends StatelessWidget {
  const CategoriesBox({Key? key, this.categories}) : super(key: key);

  final categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                )
              ]),
          child: SvgPicture.asset(
            categories["icon"],
            width: 30,
            height: 30,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          categories["name"],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: const TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
