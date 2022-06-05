import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';
import 'package:online_course_app/ui/widgets/category_box.dart';
import 'package:online_course_app/ui/widgets/notification_box.dart';
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
      title: Container(
        child: Row(
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
            NotificationBox(),
          ],
        ),
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
            padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
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

  Widget buildFeatures() {
    return CarouselSlider(
        items: [
          Container(
            width: 270,
            height: 290,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  )
                ]),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: features[0]["image"],
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
                  top: 180,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      features[0]["price"],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text("asdasdasdasd"),
                )
              ],
            ),
          ),
        ],
        options: CarouselOptions(
            height: 290, enlargeCenterPage: true, disableCenter: true));
  }
}
