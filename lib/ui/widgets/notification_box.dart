import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({Key? key, this.notificationNumber = 0})
      : super(key: key);

  final int notificationNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3))),
      child: notificationNumber > 0
          ? Badge(
              badgeColor: primary,
              position: BadgePosition(top: -7, end: 0),
              badgeContent: Text(""),
              padding: EdgeInsets.all(3),
              child: SvgPicture.asset(
                AppConstants.appBarBellIcon,
                width: 20,
                height: 20,
              ),
            )
          : SvgPicture.asset(
              AppConstants.appBarBellIcon,
              width: 20,
              height: 20,
            ),
    );
  }
}
