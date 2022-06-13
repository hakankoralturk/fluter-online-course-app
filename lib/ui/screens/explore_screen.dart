import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/theme/colors.dart';
import 'package:online_course_app/ui/widgets/category_item.dart';
import 'package:online_course_app/ui/widgets/explore_item.dart';
import 'package:online_course_app/utils/data.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            title: buildAppBar(),
          ),
          SliverToBoxAdapter(
            child: buildSearchBox(),
          ),
          SliverToBoxAdapter(
            child: buildCategoriesBox(),
          ),
          SliverList(
            delegate: buildCourses(),
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Row(
      children: const [
        Text(
          "Explore",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ],
    );
  }

  Widget buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(.05),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusColor: Colors.red,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              AppConstants.searchFilterIcon,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;
  Widget buildCategoriesBox() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
        child: Row(
          children: List.generate(
            categories.length,
            (index) => CategoryItem(
              isActive: selectedCategoryIndex == index,
              data: categories[index],
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
                ;
              },
            ),
          ),
        ),
      ),
    );
  }

  buildCourses() {
    return SliverChildBuilderDelegate(
      (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: ExploreItem(
            data: courses[index],
            tapBookmark: () {
              setState(() {
                courses[index]["is_favorited"] =
                    !courses[index]["is_favorited"];
              });
            },
          ),
        );
      },
      childCount: courses.length,
    );
  }
}
