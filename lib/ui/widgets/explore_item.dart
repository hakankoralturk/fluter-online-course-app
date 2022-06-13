import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';
import 'package:online_course_app/ui/widgets/bookmark_box.dart';
import 'package:online_course_app/utils/data.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({Key? key, required this.data, this.tapBookmark})
      : super(key: key);

  final data;
  final GestureTapCallback? tapBookmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 290,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: data["image"],
            ),
          ),
          Positioned(
            top: 175,
            right: 15,
            child: BookmarkBox(
              isBookmarked: data["is_favorited"],
              onTap: tapBookmark,
            ),
          ),
          Positioned(
            top: 215,
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses[0]["name"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getAttibute(
                          Icons.sell_outlined, data["price"], labelColor),
                      getAttibute(Icons.play_circle_outline, data["session"],
                          labelColor),
                      getAttibute(Icons.schedule_outlined, data["duration"],
                          labelColor),
                      getAttibute(Icons.star, data["review"], yellow),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAttibute(IconData icon, String name, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 13, color: labelColor),
        ),
      ],
    );
  }
}
