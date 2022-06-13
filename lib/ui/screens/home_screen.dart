import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';
import 'package:online_course_app/ui/widgets/category_box.dart';
import 'package:online_course_app/ui/widgets/feature_item.dart';
import 'package:online_course_app/ui/widgets/notification_box.dart';
import 'package:online_course_app/ui/widgets/recommend_item.dart';
import 'package:online_course_app/utils/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hakan KORALTÜRK",
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Günaydın",
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const NotificationBox(
            notificationNumber: 2,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategories(),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          buildFeatures(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recommended",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: labelColor, fontSize: 14),
                )
              ],
            ),
          ),
          buildRecommends(),
        ],
      ),
    );
  }

  Widget buildCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          AppConstants.categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoriesBox(categories: AppConstants.categories[index]),
          ),
        ),
      ),
    );
  }

  Widget buildRecommends() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 15, bottom: 5),
            child: RecommendItem(
              data: recommends[index],
              onTap: () {
                print(index);
              },
            ),
          ),
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

  Widget buildFeatures() {
    return CarouselSlider(
        items: List.generate(
            features.length,
            (index) => FeatureItem(
                  data: features[index],
                  onTap: () {
                    print(index);
                  },
                )),
        options: CarouselOptions(
            height: 290, enlargeCenterPage: true, disableCenter: true));
  }
}
