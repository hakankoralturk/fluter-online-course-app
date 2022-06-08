import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/ui/theme/colors.dart';
import 'package:online_course_app/utils/data.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key, this.data, this.onTap}) : super(key: key);

  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: data["image"],
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  recommends[0]["price"],
                  maxLines: 1,
                  style: const TextStyle(color: textColor),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    buildAttributeBox(
                        data["session"], Icons.play_circle_outline, labelColor),
                    SizedBox(
                      width: 10,
                    ),
                    buildAttributeBox(recommends[0]["duration"],
                        Icons.schedule_outlined, labelColor),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildAttributeBox(String info, IconData icon, Color iconColor) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          style: const TextStyle(color: labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
