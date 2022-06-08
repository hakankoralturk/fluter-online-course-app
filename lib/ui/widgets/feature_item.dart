import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/ui/theme/colors.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({Key? key, required this.data, required this.onTap})
      : super(key: key);

  final data;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1),
              )
            ]),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 190,
                  margin: const EdgeInsets.only(bottom: 20),
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
                Positioned(
                  top: 170,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      data["price"],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildAttributeBox(data["session"],
                          Icons.play_circle_outline, labelColor),
                      const SizedBox(width: 10),
                      buildAttributeBox(data["duration"],
                          Icons.schedule_outlined, labelColor),
                      const SizedBox(width: 10),
                      buildAttributeBox(data["review"], Icons.star, yellow),
                    ],
                  ),
                ],
              ),
            ),
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
